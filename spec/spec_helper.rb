require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'test_helper'

Capybara.default_driver = :selenium
Capybara.app_host = "http://www.youtube.com"

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include TestHelper
end