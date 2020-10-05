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
      raise ArgumentError, 'Argument `file_path` must be a String.' unless file_path.is_a?(String)

      @file_path = file_path
      @parsed = false
      @res = {}
    end

    def parsed?
      @parsed
    end

    def parse!
      File.foreach(file_path).with_index do |line, index|
        parse_line(line, index)
      end
      @parsed = true
      res
    end

    private

    attr_reader :res, :file_path

    def parse_line(line, index)
      uri, ip = line.split(' ')

      raise LogsAnalyzer::ParseError, "Invalid line: #{index}." unless uri && ip

      # ensures uri is already initialized in result
      res[uri] ||= {
        total: 0,
        unique: 0
      }

      add_visit_to_result(uri, ip)
    end

    def add_visit_to_result(uri, ip)
      if res[uri][ip]
        res[uri][ip] += 1
      else
        res[uri][ip] = 1
        res[uri][:unique] += 1
      end
      res[uri][:total] += 1
    end
  end
end
