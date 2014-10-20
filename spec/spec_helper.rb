require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'test_helper'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = "http://portaal-test.woonnet.be/"


RSpec.configure do |config|
  config.include Capybara::DSL
  config.include TestHelper
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end