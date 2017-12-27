require "bundler/setup"
require "pry"
require "timecop"
require "time_period"
require_relative "./shared_examples/time_period"
require_relative "./shared_examples/rolling_time_period"

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.around(:each) do |example|
    Time.use_zone("UTC") { example.run }
  end
end
