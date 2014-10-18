require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'test_helper'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include TestHelper
end