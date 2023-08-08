require 'fastlane'
require 'httparty'

module Fastlane
  module Actions
    module ExportHelper
      require_relative '../api/client'
      # Helper class to retreive remote file path
      class Retreive < Action
        def self.run(params)
          poeditor = API::Client.new(params[:api_token], params[:project_id])
          begin
            UI.verbose 'Retrieving file path from POEditor...'
            raw = poeditor.export(params[:export_format], params[:language], params[:tag])
          rescue TypeError => e
            UI.error e
            UI.user_error! 'Errors during communicating with POEditor API...'
          else
            UI.verbose 'Retrieved remote localization file path'
            UI.verbose raw
            raw[:result][:url]
          end
        end
      end

      # Helper class to download and save translation file
      class Save < Action
        def self.run(params, remote_path)
          UI.verbose 'Downloading remote translations...'
          translations = HTTParty.get(remote_path)
          local_path = params[:output_path] or "#{params[:language]}.strings"
          File.write(local_path, translations)
          UI.success 'Exported from POEditor!'
        end
      end
    end
  end
end

module Fastlane
  module Actions
    class PoeditorExportAction < Action
      def self.run(params)
        remote_path = ExportHelper::Retreive.run(params)
        ExportHelper::Save.run(params, remote_path) unless remote_path.nil?
      end

      def self.description
        'Exports translations from POEditor.com'
      end

      def self.authors
        ['James Campbell', 'Bruno Scheele', 'Daniel Lisovoy']
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(
            key: :api_token,
            env_name: 'POEDITOR_API_TOKEN',
            description: 'The API token for a POEditor.com Account',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :project_id,
            env_name: 'POEDITOR_PROJECT_ID',
            description: 'The ID of the POEditor.com Project to export',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :export_format,
            env_name: 'POEDITOR_EXPORT_FORMAT',
            description: 'The format to export to',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :language,
            env_name: 'POEDITOR_EXPORT_LANGUAGE',
            description: 'The language to export',
            optional: false,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :tag,
            env_name: 'POEDITOR_TAG',
            description: 'The tag to export',
            optional: true,
            type: String
          ),
          FastlaneCore::ConfigItem.new(
            key: :output_path,
            env_name: 'POEDITOR_OUTPUT_PATH',
            description: '
              The output path for exported file.
              If not provided, it defaults to the export language with the .strings extension
              ',
            optional: true,
            type: String
          )
        ]
      end

      def self.is_supported?(_platform)
        true
      end
    end
  end
end
