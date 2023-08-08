require 'fastlane/plugin/poeditor_export/version'

module Fastlane
  module PoeditorExport
    # Return all .rb files inside the "actions" and "api" directory
    def self.all_classes
      Dir[File.expand_path('**/{actions,api}/*.rb', File.dirname(__FILE__))]
    end
  end
end

# By default we want to import all available actions and helpers
# A plugin can contain any number of actions and plugins
Fastlane::PoeditorExport.all_classes.each do |current|
  require current
end
