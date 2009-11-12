module FFI::Library
  DEFAULT = FFI::DynamicLibrary.open(nil, FFI::DynamicLibrary::RTLD_LAZY | FFI::DynamicLibrary::RTLD_GLOBAL)

  def ffi_lib(*names)
    ffi_libs = []
    errors = {}
    names.each do |name|
      [ name, FFI.map_library_name(name) ].each do |libname|
        begin
          lib = FFI::DynamicLibrary.open(libname, FFI::DynamicLibrary::RTLD_LAZY | FFI::DynamicLibrary::RTLD_GLOBAL)
          if lib
            ffi_libs << lib
            break
          end
        rescue Exception => ex
          errors[name] = ex
        end
      end
    end

    if ffi_libs.empty?
      msgs = []
      errors.each {|name, ex| msgs << "Failed to load library '#{name}': #{ex.message}" }
      raise LoadError.new(msgs.join('\n'))
    end

    @ffi_libs = ffi_libs
  end

  def ffi_convention(convention)
    @ffi_convention = convention
  end

  def ffi_libraries
    unless defined?(@ffi_libs) or self.name.nil?
      libs = []
      # Try the exact name (e.g. User32) and all lower case (e.g. LibC -> libc)
      [ self.name, self.name.downcase ].each do |name|
        begin
          libs << FFI::DynamicLibrary.open(name, FFI::DynamicLibrary::RTLD_LAZY | FFI::DynamicLibrary::RTLD_GLOBAL)
        rescue Exception
        end
      end
      @ffi_libs = libs unless libs.empty?
    end
    defined?(@ffi_libs) ? @ffi_libs : [ DEFAULT ]
  end

  ##
  # Attach C function +name+ to this module.
  #
  # If you want to provide an alternate name for the module function, supply
  # it after the +name+, otherwise the C function name will be used.#
  #
  # After the +name+, the C function argument types are provided as an Array.
  #
  # The C function return type is provided last.

  def attach_function(mname, a3, a4, a5=nil)
    cname, arg_types, ret_type = a5 ? [ a3, a4, a5 ] : [ mname.to_s, a3, a4 ]

    # Convert :foo to the native type
    arg_types.map! { |e| find_type(e) }
    options = Hash.new
    options[:convention] = defined?(@ffi_convention) ? @ffi_convention : :default
    options[:type_map] = defined?(@ffi_typedefs) ? @ffi_typedefs : nil
    options[:enums] = defined?(@ffi_enum_map) ? @ffi_enum_map : nil

    # Try to locate the function in any of the libraries
    invokers = []
    load_error = nil
    ffi_libraries.each do |lib|
      begin
        invokers << FFI.create_invoker(lib, cname.to_s, arg_types, find_type(ret_type), options)
      rescue LoadError => ex
        load_error = ex
      end if invokers.empty?
      end
    invoker = invokers.compact.shift
    raise load_error if load_error && invoker.nil?
    #raise FFI::NotFoundError.new(cname.to_s, *libraries) unless invoker
    invoker.attach(self, mname.to_s)
    invoker # Return a version that can be called via #call
  end

  def attach_variable(mname, a1, a2 = nil)
    cname, type = a2 ? [ a1, a2 ] : [ mname.to_s, a1 ]
    address = nil
    ffi_libraries.each do |lib|
      begin
        address = lib.find_variable(cname.to_s)
        break unless address.nil?
      rescue LoadError
      end
    end

    raise FFI::NotFoundError.new(cname, ffi_libraries) if address.nil? || address.null?
    sc = Class.new(FFI::Struct)
    sc.layout :gvar, find_type(type)
    s = sc.new(address)

    #
    # Attach to this module as mname/mname=
    #
    self.module_eval <<-code
      @@ffi_gvar_#{mname} = s
      def self.#{mname}
        @@ffi_gvar_#{mname}[:gvar]
      end
      def self.#{mname}=(value)
        @@ffi_gvar_#{mname}[:gvar] = value
      end
    code

    address
  end

  def callback(*args)
    raise ArgError, "wrong number of arguments" if args.length < 2 || args.length > 3
    name, params, ret = if args.length == 3
      args
    else
      [ nil, args[0], args[1] ]
    end
    cb = FFI::CallbackInfo.new(find_type(ret), params.map { |e| find_type(e) })

    # Add to the symbol -> type map (unless there was no name)
    unless name.nil?
      @ffi_callbacks = Hash.new unless defined?(@ffi_callbacks)
      @ffi_callbacks[name] = cb
    end

    cb
  end

  def typedef(current, add, info=nil)
    @ffi_typedefs = Hash.new unless defined?(@ffi_typedefs)
    code = if current.kind_of?(FFI::Type)
      current
    else
      @ffi_typedefs[current] || FFI.find_type(current)
    end

    @ffi_typedefs[add] = code
  end

  def enum(*args)
    #
    # enum can be called as:
    # enum :zero, :one, :two  # unnamed enum
    # enum [ :zero, :one, :two ] # equivalent to above
    # enum :foo, [ :zero, :one, :two ] create an enum named :foo
    #
    name, values = if args[0].kind_of?(Symbol) && args[1].kind_of?(Array)
      [ args[0], args[1] ]
    elsif args[0].kind_of?(Array)
      [ nil, args[0] ]
    else
      [ nil, args ]
    end
    @ffi_enums = FFI::Enums.new unless defined?(@ffi_enums)
    @ffi_enums << (e = FFI::Enum.new(values, name))
    @ffi_enum_map = Hash.new unless defined?(@ffi_enum_map)
    # append all the enum values to a global :name => value map
    @ffi_enum_map.merge!(e.symbol_map)

    # If called as enum :foo, [ :zero, :one, :two ], add a typedef alias
    typedef(e, name) if name
    e
  end

  def enum_type(name)
    @ffi_enums.find(name) if defined?(@ffi_enums)
  end

  def enum_value(symbol)
    @ffi_enums.__map_symbol(symbol)
  end

  def find_type(name)
    code = if defined?(@ffi_typedefs) && @ffi_typedefs.has_key?(name)
      @ffi_typedefs[name]
    elsif defined?(@ffi_callbacks) && @ffi_callbacks.has_key?(name)
      @ffi_callbacks[name]
    elsif name.is_a?(Class) && name < FFI::Struct
      FFI::NativeType::POINTER
    elsif name.kind_of?(FFI::Type)
      name
    end
    if code.nil? || code.kind_of?(Symbol)
      FFI.find_type(name)
    else
      code
    end
  end
end
