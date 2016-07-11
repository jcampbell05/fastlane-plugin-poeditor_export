# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/poeditor_export/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-poeditor_export'
  spec.version       = Fastlane::PoeditorExport::VERSION
  spec.author        = %q{James Campbell}
  spec.email         = %q{james@supmenow.com}

  spec.summary       = %q{Exports translations from POEditor.com}
  # spec.homepage      = "https://github.com/<GITHUB_USERNAME>/fastlane-plugin-poeditor_export"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  # spec.add_dependency 'your-dependency', '~> 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 1.97.2'
end
