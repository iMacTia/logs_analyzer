# LogsAnalyzer

#### LA-001
As a user, I want to be able to see a report showing the list of visits to my website
ordered from most page views to less page views.
There should be 2 available reports: total visits and unique visits.

Acceptance criteria:
* Servers will generate hourly logs, each line showing the visited pages and the visitor ip address
* A script should run against these logs to parse the required information and aggregate it by page and ip address
* Results should be sorted in DESCENDING order
* In the total visits report, every line of the log file should be counted towards the visited page
* In the unique visits report, the same ip address visiting the same page should be counted only once

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'logs_analyzer'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install logs_analyzer

## Usage

After the gem have been installed, you can use the provided executable to parse a log file:

```shell script
logs_analyzer spec/fixtures/files/webserver.log
```

See the next section on how to install it on your local machine or how to run the executable without installing the gem.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

To test the executable script without installing the gem locally, use the following from the gem root:

```shell script
ruby -Ilib exe/logs_analyzer spec/fixtures/files/webserver.log
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/iMacTia/logs_analyzer.
This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/iMacTia/logs_analyzer/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LogsAnalyzer project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/iMacTia/logs_analyzer/blob/master/CODE_OF_CONDUCT.md).
