# frozen_string_literal: true

module LogsAnalyzer
  # The Formatter class is responsible for formatting the result of a
  # logfile parsed by `LogAnalyzer::Parser`.
  #
  # @example
  #   result = parser.parse!
  #   formatted = LogsAnalyzer.format(result)
  #
  class Formatter
    # Helper class method to save on the instantiation
    # # @param parsed [Hash] the logs info parsed by `LogAnalyzer::Parser`
    def self.format(parsed)
      ''
    end
  end
end
