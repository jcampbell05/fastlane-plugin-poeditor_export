module Fastlane
  module Actions
    class PoeditorExportAction < Action
      def self.run(params)

          file_uri = Helper::PoeditorExportHelper.export_for_lanaguage(params)
          res = Net::HTTP.get_response(file_uri)

          File.open(params[:output_path], 'w+') { |file| file.write(res.body) }
          UI.message('Exported from POEditor!')
      end

      def self.description
        "Exports translations from POEditor.com"
      end

      def self.authors
        ["James Campbell"]
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :api_token,
                                  env_name: "POEDITOR_API_TOKEN",
                               description: "The API token for a POEditor.com Account",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :project_id,
                                  env_name: "POEDITOR_PROJECT_ID",
                               description: "The ID of the POEditor.com Project to export",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :export_format,
                                  env_name: "POEDITOR_EXPORT_FORMAT",
                               description: "The format to export to",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :language,
                                  env_name: "POEDITOR_EXPORT_LANGUAGE",
                               description: "The language to export",
                                  optional: false,
                                      type: String),
          FastlaneCore::ConfigItem.new(key: :output_path,
                                  env_name: "POEDITOR_OUTPUT_PATH",
                               description: "The output path for exported file",
                                  optional: false,
                                      type: String)
        ]
      end

      def self.is_supported?(platform)
        true
      end
    end
  end
end
