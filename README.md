# TimePeriod

`TimePeriod` is a value object based around `ActiveSupport::Duration` which allows the user to more expressively describe notions such as `Week.this` or `Month.next`.

**TODO**:
  - [ ] ORM adapters for duration-based scopes
  - [ ] Include standardized parameterization to facilitate use in web requests
  - [ ] Remove `ActiveSupport` dependency

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'time_period'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install time_period

## Usage

**TODO**

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zestyzesty/time_period.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the TimePeriod project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/time_period/blob/master/CODE_OF_CONDUCT.md).
