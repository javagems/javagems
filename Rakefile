desc "Builds a JAR from the contents of the current directory."
task :build do
  files = FileList["*"].exclude("{.git*,build,Rakefile}")
  system("jar", "cvf", "build/javagems.jar", *files) || raise("Well that didn't work out quite right. Sorry.")
end

task :default do
  puts "You probably want one of these commands:"
  exec("rake -T")
end

