# frozen_string_literal: true

RSpec.describe LogsAnalyzer::Formatter do
  let(:file_path) { 'spec/fixtures/files/webserver.log' }
  let(:parsed) { LogsAnalyzer::Parser.parse!(file_path) }
  let(:formatter) { LogsAnalyzer::Formatter.new(parsed) }

  describe '#total_report' do
    subject { formatter.total_report }

    it 'returns total visits report for all pages' do
      expect(subject.split("\n").size).to eq(6)
    end

    it 'returns the most visited page at the top' do
      is_expected.to start_with('/about/2: 90')
    end

    it 'returns the least visited page at the bottom' do
      is_expected.to end_with('/home: 78')
    end
  end

  describe '#unique_report' do
    subject { formatter.unique_report }

    it 'returns unique visits report for all pages' do
      expect(subject.split("\n").size).to eq(6)
    end

    it 'returns the most uniquely visited page at the top' do
      is_expected.to start_with('/help_page/1: 23')
    end

    it 'returns the least uniquely visited page at the bottom' do
      is_expected.to end_with('/about: 21')
    end
  end
end
