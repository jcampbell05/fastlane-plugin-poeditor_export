require 'spec_helper'

describe Fastlane::Actions::PoeditorExportAction do
  describe '#invalid_mock' do
    let(:invalid_response_body) { JSON.parse(File.read('./spec/poeditor_export_invalid_response.json')) }
    let(:invalid_response) do
      instance_double(
        HTTParty::Response,
        body: invalid_response_body,
        parsed_response: invalid_response_body.to_h
      )
    end

    before do
      allow(Fastlane::API::Client).to receive(:post).and_return(invalid_response)
    end

    it 'handles ininvalid responces' do
      allow(Fastlane::UI).to receive(:user_error!)
      expect(Fastlane::UI).to receive(:user_error!).with('Errors during communicating with POEditor API...')
      Fastlane::Actions::PoeditorExportAction.run(
        {
          api_token: 'invalid_api_token',
          project_id: '12345',
          export_format: 'apple_strings',
          language: 'en',
          output_path: 'Localizable.strings'
        }
      )
    end
  end

  describe '#valid_mock' do
    let(:valid_response_body) { JSON.parse(File.read('./spec/poeditor_export_valid_response.json')) }
    let(:valid_response) do
      instance_double(
        HTTParty::Response,
        body: valid_response_body,
        parsed_response: valid_response_body.to_h
      )
    end

    before do
      allow(Fastlane::API::Client).to receive(:post).and_return(valid_response)
    end

    it 'handles valid responce' do
      expect(Fastlane::UI).to receive(:success).with('Exported from POEditor!')
      Fastlane::Actions::PoeditorExportAction.run(
        {
          api_token: 'valid_api_token',
          project_id: '12345',
          export_format: 'apple_strings',
          language: 'en',
          output_path: 'Localizable.strings'
        }
      )
    end
  end
end
