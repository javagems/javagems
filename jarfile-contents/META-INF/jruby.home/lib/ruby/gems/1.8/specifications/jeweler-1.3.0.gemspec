# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{jeweler}
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Josh Nichols"]
  s.date = %q{2009-10-17}
  s.default_executable = %q{jeweler}
  s.description = %q{Simple and opinionated helper for creating Rubygem projects on GitHub}
  s.email = %q{josh@technicalpickles.com}
  s.executables = ["jeweler"]
  s.extra_rdoc_files = ["ChangeLog.markdown", "LICENSE", "README.markdown"]
  s.files = [".gitignore", "ChangeLog.markdown", "LICENSE", "README.markdown", "Rakefile", "VERSION.yml", "bin/jeweler", "features/generator/cucumber.feature", "features/generator/directory_layout.feature", "features/generator/dotdocument.feature", "features/generator/env_options.feature", "features/generator/git.feature", "features/generator/license.feature", "features/generator/rakefile.feature", "features/generator/readme.feature", "features/generator/test.feature", "features/generator/test_helper.feature", "features/placeholder.feature", "features/step_definitions/debug_steps.rb", "features/step_definitions/filesystem_steps.rb", "features/step_definitions/generator_steps.rb", "features/step_definitions/task_steps.rb", "features/support/env.rb", "features/tasks/build_gem.feature", "features/tasks/version.feature", "features/tasks/version_bumping.feature", "jeweler.gemspec", "lib/jeweler.rb", "lib/jeweler/commands.rb", "lib/jeweler/commands/build_gem.rb", "lib/jeweler/commands/check_dependencies.rb", "lib/jeweler/commands/install_gem.rb", "lib/jeweler/commands/release_to_gemcutter.rb", "lib/jeweler/commands/release_to_git.rb", "lib/jeweler/commands/release_to_github.rb", "lib/jeweler/commands/release_to_rubyforge.rb", "lib/jeweler/commands/setup_rubyforge.rb", "lib/jeweler/commands/validate_gemspec.rb", "lib/jeweler/commands/version/base.rb", "lib/jeweler/commands/version/bump_major.rb", "lib/jeweler/commands/version/bump_minor.rb", "lib/jeweler/commands/version/bump_patch.rb", "lib/jeweler/commands/version/write.rb", "lib/jeweler/commands/write_gemspec.rb", "lib/jeweler/errors.rb", "lib/jeweler/gemcutter_tasks.rb", "lib/jeweler/gemspec_helper.rb", "lib/jeweler/generator.rb", "lib/jeweler/generator/application.rb", "lib/jeweler/generator/bacon_mixin.rb", "lib/jeweler/generator/github_mixin.rb", "lib/jeweler/generator/micronaut_mixin.rb", "lib/jeweler/generator/minitest_mixin.rb", "lib/jeweler/generator/options.rb", "lib/jeweler/generator/rdoc_mixin.rb", "lib/jeweler/generator/riot_mixin.rb", "lib/jeweler/generator/rspec_mixin.rb", "lib/jeweler/generator/shoulda_mixin.rb", "lib/jeweler/generator/testspec_mixin.rb", "lib/jeweler/generator/testunit_mixin.rb", "lib/jeweler/generator/yard_mixin.rb", "lib/jeweler/rubyforge_tasks.rb", "lib/jeweler/specification.rb", "lib/jeweler/tasks.rb", "lib/jeweler/templates/.document", "lib/jeweler/templates/.gitignore", "lib/jeweler/templates/LICENSE", "lib/jeweler/templates/README.rdoc", "lib/jeweler/templates/Rakefile", "lib/jeweler/templates/bacon/flunking.rb", "lib/jeweler/templates/bacon/helper.rb", "lib/jeweler/templates/features/default.feature", "lib/jeweler/templates/features/support/env.rb", "lib/jeweler/templates/micronaut/flunking.rb", "lib/jeweler/templates/micronaut/helper.rb", "lib/jeweler/templates/minitest/flunking.rb", "lib/jeweler/templates/minitest/helper.rb", "lib/jeweler/templates/riot/flunking.rb", "lib/jeweler/templates/riot/helper.rb", "lib/jeweler/templates/rspec/flunking.rb", "lib/jeweler/templates/rspec/helper.rb", "lib/jeweler/templates/rspec/spec.opts", "lib/jeweler/templates/shoulda/flunking.rb", "lib/jeweler/templates/shoulda/helper.rb", "lib/jeweler/templates/testspec/flunking.rb", "lib/jeweler/templates/testspec/helper.rb", "lib/jeweler/templates/testunit/flunking.rb", "lib/jeweler/templates/testunit/helper.rb", "lib/jeweler/version_helper.rb", "test/fixtures/bar/VERSION.yml", "test/fixtures/bar/bin/foo_the_ultimate_bin", "test/fixtures/bar/hey_include_me_in_gemspec", "test/fixtures/bar/lib/foo_the_ultimate_lib.rb", "test/fixtures/existing-project-with-version-constant/.document", "test/fixtures/existing-project-with-version-constant/.gitignore", "test/fixtures/existing-project-with-version-constant/LICENSE", "test/fixtures/existing-project-with-version-constant/README.rdoc", "test/fixtures/existing-project-with-version-constant/Rakefile", "test/fixtures/existing-project-with-version-constant/existing-project-with-version.gemspec", "test/fixtures/existing-project-with-version-constant/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-constant/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-constant/test/test_helper.rb", "test/fixtures/existing-project-with-version-plaintext/.document", "test/fixtures/existing-project-with-version-plaintext/.gitignore", "test/fixtures/existing-project-with-version-plaintext/LICENSE", "test/fixtures/existing-project-with-version-plaintext/README.rdoc", "test/fixtures/existing-project-with-version-plaintext/Rakefile", "test/fixtures/existing-project-with-version-plaintext/VERSION", "test/fixtures/existing-project-with-version-plaintext/existing-project-with-version.gemspec", "test/fixtures/existing-project-with-version-plaintext/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-plaintext/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-plaintext/test/test_helper.rb", "test/fixtures/existing-project-with-version-yaml/.document", "test/fixtures/existing-project-with-version-yaml/.gitignore", "test/fixtures/existing-project-with-version-yaml/LICENSE", "test/fixtures/existing-project-with-version-yaml/README.rdoc", "test/fixtures/existing-project-with-version-yaml/Rakefile", "test/fixtures/existing-project-with-version-yaml/VERSION.yml", "test/fixtures/existing-project-with-version-yaml/bin/foo_the_ultimate_bin", "test/fixtures/existing-project-with-version-yaml/existing-project-with-version.gemspec", "test/fixtures/existing-project-with-version-yaml/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-yaml/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-yaml/test/test_helper.rb", "test/geminstaller.yml", "test/jeweler/commands/test_build_gem.rb", "test/jeweler/commands/test_install_gem.rb", "test/jeweler/commands/test_release_to_gemcutter.rb", "test/jeweler/commands/test_release_to_git.rb", "test/jeweler/commands/test_release_to_github.rb", "test/jeweler/commands/test_release_to_rubyforge.rb", "test/jeweler/commands/test_setup_rubyforge.rb", "test/jeweler/commands/test_validate_gemspec.rb", "test/jeweler/commands/test_write_gemspec.rb", "test/jeweler/commands/version/test_base.rb", "test/jeweler/commands/version/test_bump_major.rb", "test/jeweler/commands/version/test_bump_minor.rb", "test/jeweler/commands/version/test_bump_patch.rb", "test/jeweler/commands/version/test_write.rb", "test/jeweler/generator/test_application.rb", "test/jeweler/generator/test_options.rb", "test/jeweler/test_gemspec_helper.rb", "test/jeweler/test_generator.rb", "test/jeweler/test_generator_initialization.rb", "test/jeweler/test_generator_mixins.rb", "test/jeweler/test_specification.rb", "test/jeweler/test_tasks.rb", "test/jeweler/test_version_helper.rb", "test/shoulda_macros/jeweler_macros.rb", "test/test_helper.rb", "test/test_jeweler.rb"]
  s.homepage = %q{http://github.com/technicalpickles/jeweler}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{pickles}
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Simple and opinionated helper for creating Rubygem projects on GitHub}
  s.test_files = ["test/fixtures/bar/lib/foo_the_ultimate_lib.rb", "test/fixtures/existing-project-with-version-constant/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-constant/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-constant/test/test_helper.rb", "test/fixtures/existing-project-with-version-plaintext/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-plaintext/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-plaintext/test/test_helper.rb", "test/fixtures/existing-project-with-version-yaml/lib/existing_project_with_version.rb", "test/fixtures/existing-project-with-version-yaml/test/existing_project_with_version_test.rb", "test/fixtures/existing-project-with-version-yaml/test/test_helper.rb", "test/jeweler/commands/test_build_gem.rb", "test/jeweler/commands/test_install_gem.rb", "test/jeweler/commands/test_release_to_gemcutter.rb", "test/jeweler/commands/test_release_to_git.rb", "test/jeweler/commands/test_release_to_github.rb", "test/jeweler/commands/test_release_to_rubyforge.rb", "test/jeweler/commands/test_setup_rubyforge.rb", "test/jeweler/commands/test_validate_gemspec.rb", "test/jeweler/commands/test_write_gemspec.rb", "test/jeweler/commands/version/test_base.rb", "test/jeweler/commands/version/test_bump_major.rb", "test/jeweler/commands/version/test_bump_minor.rb", "test/jeweler/commands/version/test_bump_patch.rb", "test/jeweler/commands/version/test_write.rb", "test/jeweler/generator/test_application.rb", "test/jeweler/generator/test_options.rb", "test/jeweler/test_gemspec_helper.rb", "test/jeweler/test_generator.rb", "test/jeweler/test_generator_initialization.rb", "test/jeweler/test_generator_mixins.rb", "test/jeweler/test_specification.rb", "test/jeweler/test_tasks.rb", "test/jeweler/test_version_helper.rb", "test/shoulda_macros/jeweler_macros.rb", "test/test_helper.rb", "test/test_jeweler.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<git>, [">= 1.2.5"])
      s.add_runtime_dependency(%q<rubyforge>, [">= 2.0.0"])
      s.add_runtime_dependency(%q<gemcutter>, [">= 0.1.0"])
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_development_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<redgreen>, [">= 0"])
      s.add_development_dependency(%q<yard>, [">= 0"])
      s.add_development_dependency(%q<cucumber>, [">= 0"])
    else
      s.add_dependency(%q<git>, [">= 1.2.5"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.0"])
      s.add_dependency(%q<gemcutter>, [">= 0.1.0"])
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
      s.add_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<redgreen>, [">= 0"])
      s.add_dependency(%q<yard>, [">= 0"])
      s.add_dependency(%q<cucumber>, [">= 0"])
    end
  else
    s.add_dependency(%q<git>, [">= 1.2.5"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.0"])
    s.add_dependency(%q<gemcutter>, [">= 0.1.0"])
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    s.add_dependency(%q<mhennemeyer-output_catcher>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<redgreen>, [">= 0"])
    s.add_dependency(%q<yard>, [">= 0"])
    s.add_dependency(%q<cucumber>, [">= 0"])
  end
end
