ENV['GEMCUTTER_URL'] = ENV['JAVAGEMS_URL'] || "https://gems.javagems.org/"
require 'rubygems'
require 'rubygems/gem_runner'
require 'rubygems/exceptions'
require 'openssl'

module Gem
  DefaultGemConfigName = ".javagemrc"

  def self.config_file
    File.join Gem.user_home, DefaultGemConfigName
  end

  ConfigFile::PLATFORM_DEFAULTS.merge!(
    "install" => "--no-env-shebang --no-wrappers",
    "update"  => "--no-env-shebang --no-wrappers",
    :sources  => %w[http://gems.javagems.org/],
    :gemhome  => File.join(Gem.user_home, ".javagem/java"),
    :gempath  => [File.join(Gem.user_home, ".javagem/java")]
  )

end

class Gem::AbstractCommand < Gem::Command
  remove_const :URL 
  remove_const :DESTINATION_NAME
  URL = "http://javagems.org"
  DESTINATION_NAME = "JavaGems"
end

required_version = Gem::Requirement.new "> 1.8.3"

unless required_version.satisfied_by? Gem.ruby_version then
  abort "Expected Ruby Version #{required_version}, was #{Gem.ruby_version}"
end

args = ARGV.clone

begin
  Gem::GemRunner.new.run args
rescue Gem::SystemExitException => e
  exit e.exit_code
end
