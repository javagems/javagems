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
