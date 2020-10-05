# frozen_string_literal: true

module LogsAnalyzer
  # The Parser class is responsible for parsing the log file efficiently
  # and aggregating the information into a memory structure.
  #
  # @example
  #   parser = LogsAnalyzer::Parser.new('./file.log')
  #   result = parser.parse!
  #
  # @example
  #   result = LogsAnalyzer::Parser.parse!('./file.log')
  class Parser
    # Helper class method to save on the instantiation
    # @param file_path [String] the path to the file
    def self.parse!(file_path)
      new(file_path).parse!
    end

    # Initializes a new parser with a file path, without opening it yet
    # @param file_path [String] the path to the file
    def initialize(file_path)
      @file_path = file_path
    end

    def parse!
      {}
    end
  end
end
