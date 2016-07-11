describe Fastlane::Actions::PoeditorExportAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The poeditor_export plugin is working!")

      Fastlane::Actions::PoeditorExportAction.run(nil)
    end
  end
end
