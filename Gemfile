ruby '3.0.5'
source 'https://rubygems.org'

gemspec

gem 'bundler', '~> 2.3'
gem 'dry-struct', '~> 1.6'
gem 'dry-validation', '~> 1.10'
gem 'fastlane', '~> 2.214'
gem 'httpparty', '~> 0.2.0'

group :test do
  gem 'rspec', '~> 3.5'
end

group :development do
  gem 'debase', '= 0.2.5.beta2'
  gem 'pry', '~> 0.10.4'
  gem 'rake', '~> 11.2'
  gem 'reek', '~> 6.1'
  gem 'rubocop', '~> 1.55'
  gem 'ruby-debug-ide', '~> 0.7.3'
  gem 'solargraph', '~> 0.49'
end

plugins_path = File.join(File.dirname(__FILE__), 'fastlane', 'Pluginfile')
eval(File.read(plugins_path), binding) if File.exist?(plugins_path)
