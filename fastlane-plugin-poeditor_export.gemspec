lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/poeditor_export/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-poeditor_export'
  spec.version       = Fastlane::PoeditorExport::VERSION
  spec.author        = 'James Campbell'
  spec.email         = 'james@supmenow.com'

  spec.summary       = 'Exports translations from POEditor.com'
  spec.homepage      = 'https://github.com/Supmenow/fastlane-plugin-poeditor_export'
  spec.license       = 'MIT'

  spec.files         = Dir['lib/**/*'] + %w[README.md LICENSE]
  spec.require_paths = ['lib']
  spec.required_ruby_version = '3.0.5'

  spec.metadata['rubygems_mfa_required'] = 'true'
end
