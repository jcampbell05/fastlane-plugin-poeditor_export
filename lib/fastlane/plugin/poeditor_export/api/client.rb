# Use the class methods to get down to business quickly
require 'httparty'
require_relative '../misc/deep_merge'
require_relative 'types'
require_relative 'schemas'

module Fastlane
  module API
    class Client
      include HTTParty

      base_uri 'https://api.poeditor.com/v2'

      def initialize(token, project_id)
        @options = {
          body: { api_token: token, id: project_id }
        }
      end

      # Returns the link of the file (expires after 10 minutes).
      # The settings inherited from the project will be the ones at the time of the download.
      def export(type, language, tags)
        contract = Schemas::Export.new

        response = self.class.post('/projects/export', export_options(type, language, tags))
        validation = contract.call(response.parsed_response)

        errors = validation.errors
        raise TypeError, errors.to_h unless errors.empty?

        validation.to_h
      end

      private

      def export_options(type, language, tags)
        export_options = @options.clone
        export_options = export_options.deep_merge({ tags: tags }) unless tags.nil?
        export_options.deep_merge({ body: { type: type, language: language } })
      end
    end
  end
end
