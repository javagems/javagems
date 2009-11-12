ENV['GEM_HOME'] = ENV['JAVAGEM_HOME'] || "~/.javagem/java"
ENV['GEM_PATH'] = ENV['JAVAGEM_PATH'] || "~/.javagem/java"
ENV['GEMCUTTER_URL'] = ENV['JAVAGEMS_URL'] || "http://www.javagems.org/"
require 'rubygems'
require 'rubygems/gem_runner'
require 'rubygems/exceptions'
require 'rubygems/dependency_installer'

module Gem
  DefaultGemConfigName = ".javagemrc"
  DefaultGemSources = %w[http://gems.javagems.org/]

  def self.default_sources
    DefaultGemSources
  end

  def self.config_file
    File.join Gem.user_home, DefaultGemConfigName
  end

end

# We don't actually want wrappers in most cases for JavaGems. So nix 'em
Gem::DependencyInstaller::DEFAULT_OPTIONS.merge(:wrappers => false)

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
