# frozen_string_literal: true

# Set the environment to "test"
ENV['ENVIRONMENT'] = 'test'

# Require all the testing gems
require 'capybara'
require 'capybara/rspec'
require 'rspec'
require 'simplecov'
require 'simplecov-console'
require_relative './setup_test_database'

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website?
  SimpleCov::Formatter::HTMLFormatter
  ])
SimpleCov.start

# Bring in the contents of the `app.rb` file. The below is equivalent to: require_relative '../app.rb'
require File.join(File.dirname(__FILE__), '..', 'app.rb')

# Tell Capybara to talk to MeakPicker
Capybara.app = MealPicker

RSpec.configure do |config|
  config.before(:each) do
    setup_test_database
  end

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
end
