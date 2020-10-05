# frozen_string_literal: true

RSpec.describe LogsAnalyzer::Parser do
  let(:parser) { described_class.new(file_path) }
  subject { parser.parse! }

  context 'when file_path is invalid' do
    let(:file_path) { 1234 }

    it do
      expect { parser }.to raise_error(ArgumentError)
    end
  end

  context 'with an invalid log file' do
    let(:file_path) { 'spec/fixtures/files/invalid.log' }

    it do
      expect { subject }.to raise_error(LogsAnalyzer::ParseError, 'Invalid line: 0.')
    end
  end

  context 'with an empty log file' do
    let(:file_path) { 'spec/fixtures/files/empty.log' }

    it do
      is_expected.to be_empty
    end
  end

  context 'with a simple log file' do
    let(:file_path) { 'spec/fixtures/files/simple.log' }
    let(:expected_result) do
      {
        '/home' => {
          "111.222.333.444" => 1,
          total: 1,
          unique: 1
        },
        '/about' => {
          "111.222.333.444" => 2,
          total: 2,
          unique: 1
        }
      }
    end

    it do
      is_expected.to eq(expected_result)
    end
  end

  context 'with a complex log file' do
    let(:file_path) { 'spec/fixtures/files/webserver.log' }

    it 'is expected to parse all pages' do
      expect(subject.keys.size).to eq(6)
    end

    it 'is expected to count correctly visits' do
      sum = subject.values.map { |v| v[:total] }.sum
      expect(sum).to eq(500)
    end

    it 'is expected to count correctly unique visits' do
      sum = subject.values.map { |v| v[:unique] }.sum
      expect(sum).to eq(135)
    end
  end
end
