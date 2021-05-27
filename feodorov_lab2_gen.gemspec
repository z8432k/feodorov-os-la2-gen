# frozen_string_literal: true

require_relative "lib/feodorov_lab2_gen/version"

Gem::Specification.new do |spec|
  spec.name          = "feodorov_lab2_gen"
  spec.version       = FeodorovLab2Gen::VERSION
  spec.authors       = ["Alexander Feodorov"]
  spec.email         = ["webmaster@unixcomp.org"]

  spec.summary       = "Прототип генератора исходного кода"
  spec.description   = "Прототип генератора исходного кода"
  spec.homepage      = "https://github.com/z8432k/feodorov-os-lab2-gen"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/z8432k/feodorov-os-lab2-gen"
  spec.metadata["changelog_uri"] = "https://github.com/z8432k/feodorov-os-lab2-gen"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency "awesome_print", "~> 1.9"
  spec.add_dependency "activesupport", "~> 6.1"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
