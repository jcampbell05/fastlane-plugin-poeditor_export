module Fastlane
  module Helper
    class PoeditorExportHelper
      # class methods that you define here become available in your action
      # as `Helper::PoeditorExportHelper.your_method`
      #
      def self.show_message
        UI.message("Hello from the poeditor_export plugin helper!")
      end
    end
  end
end
