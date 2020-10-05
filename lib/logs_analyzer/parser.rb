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
    attr_reader :result, :file_path

    # Helper class method to save on the instantiation
    # @param file_path [String] the path to the file
    # @return [Hash] the parsing result
    def self.parse!(file_path)
      new(file_path).parse!
    end

    # Initializes a new parser with a file path, without opening it yet
    # @param file_path [String] the path to the file
    # @raise [ArgumentError] if file_path is not a String
    def initialize(file_path)
      raise ArgumentError, 'Argument `file_path` must be a String.' unless file_path.is_a?(String)

      @file_path = file_path
      @parsed = false
      @result = {}
    end

    # Checks if parse! has been called
    # @return [Boolean] true if file has been parsed, false otherwise
    def parsed?
      @parsed
    end

    # Parses the file and returns the result
    # @return [Hash] the parsing result
    # @raise [LogsAnalyzer::ParseError] if an invalid line is found while parsing
    def parse!
      # Uses `File.foreach` to reduce memory usage
      File.foreach(file_path).with_index do |line, index|
        parse_line(line, index)
      end
      @parsed = true
      result
    end

    private

    def parse_line(line, index)
      uri, ip = line.split(' ')

      raise LogsAnalyzer::ParseError, "Invalid line: #{index}." unless uri && ip

      # ensures uri is already initialized in result
      result[uri] ||= {
        total: 0,
        unique: 0
      }

      add_visit_to_result(uri, ip)
    end

    def add_visit_to_result(uri, ip)
      if result[uri][ip]
        result[uri][ip] += 1
      else
        result[uri][ip] = 1
        result[uri][:unique] += 1
      end
      result[uri][:total] += 1
    end
  end
end
