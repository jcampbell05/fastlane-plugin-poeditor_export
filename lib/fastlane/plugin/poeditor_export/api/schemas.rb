require 'dry-validation'

module Fastlane
  module API
    module Schemas
      # Generic status Contract
      class Response < Dry::Validation::Contract
        params do
          required(:code).filled(:integer)
          required(:status).filled(Types::Statuses)
          required(:message).filled(:string)
        end
      end

      # Export Contract, expected from `/projects/export` call
      class Export < Dry::Validation::Contract
        class Result < Dry::Validation::Contract
          params do
            required(:url).filled(:string)
          end
        end

        json do
          required(:response).filled(Response.schema)
          required(:result).filled(Result.schema)
        end

        rule(response: :code) do
          key.failure(value.to_s) if value != 200
        end

        rule(response: :status) do
          key.failure(value.to_s) if value != 'success'
        end

        rule(response: :message) do
          key.failure(value) if rule_error?(response: :code) || rule_error?(response: :status)
        end
      end
    end
  end
end
