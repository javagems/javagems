desc "Builds a JAR from the contents of the current directory."
task :build do
  system("jar", "cvf", "pkg/javagems.jar", "-C", "jarfile-contents/", ".") || raise("Well that didn't work out quite right. Sorry.")
end

task :default do
  puts "You probably want one of these commands:"
  exec("rake -T")
end

