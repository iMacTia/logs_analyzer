# frozen_string_literal: true

module LogsAnalyzer
  # The Formatter class is responsible for formatting the result of a
  # logfile parsed by `LogAnalyzer::Parser`.
  #
  # @example
  #   result = parser.parse!
  #   formatter = LogsAnalyzer::Formatter.new(result)
  #   report = formatter.total_report
  class Formatter
    # Initializes a new formatter with the parsed hash from a parser
    # @param parsed [Hash] the logs info parsed by a `LogAnalyzer::Parser`
    def initialize(parsed)
      @parsed = parsed
    end

    # Returns a report with the total visits per page, in CSV format
    # @return [String] the report in CSV format
    def total_report
      ''
    end

    # Returns a report with the total visits per page, in CSV format
    # @return [String] the report in CSV format
    def unique_report
      ''
    end

    private

    def format_visits(key)
      ''
    end
  end
end
