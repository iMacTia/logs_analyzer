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

    # Returns a report with the total visits per page
    # @return [String] the report
    def total_report
      format_visits(:total).join("\n")
    end

    # Returns a report with the total visits per page
    # @return [String] the report
    def unique_report
      format_visits(:unique).join("\n")
    end

    private

    def format_visits(key)
      @parsed.sort_by { |_, v| -v[key] }.map { |k, v| "#{k}: #{v[key]}" }
    end
  end
end
