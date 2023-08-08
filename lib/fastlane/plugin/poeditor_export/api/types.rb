require 'dry-types'

module Fastlane
  module API
    # Custom types
    module Types
      include Dry::Types()

      Statuses = Types::String.enum('success', 'fail')
    end
  end
end
