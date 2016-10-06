module Fastlane
  module Helper
    class PoeditorExportHelper
      API_URL = 'https://poeditor.com/api/'
      EXPORT_ACTION = 'export'
      
      def self.export_for_language(params)
        uri = URI(API_URL)

        export_params = {
          api_token: params[:api_token],
          action: EXPORT_ACTION,
          id: params[:project_id],
          type: params[:export_format],
          language: params[:language]
        }

        res = Net::HTTP.post_form(uri, export_params)
        json = JSON.parse(res.body)
        URI(json["item"])
      end
    end
  end
end
