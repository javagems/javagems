desc "Builds a JAR from the contents of the current directory."
task :build_jar do
  system("jar", "cvfm", "pkg/javagems.jar", "jarfile-contents/META-INF/MANIFEST.MF", "-C", "jarfile-contents/", ".") || raise("Well that didn't work out quite right. Sorry.")
end

desc "Builds the JAR then a RubyGem containing it."
task :build_gem => :build_jar do
  system("cp pkg/javagems.jar gem/jar/ && cd gem && rake build && cp pkg/*.gem ../pkg/")
end

task :default do
  puts "You probably want one of these commands:"
  exec("rake -T")
end

