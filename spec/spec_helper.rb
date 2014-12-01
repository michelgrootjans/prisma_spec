require 'rspec'
require 'capybara'
require 'capybara/dsl'
require 'faker'
require 'site_prism'
require 'test_helper'

Capybara.run_server = false
Capybara.default_driver = :selenium
Capybara.app_host = "http://portaal-test.woonnet.be/"

Dir[File.join(File.dirname(__FILE__), 'pages', '**', '*.rb')].each{|f| require f }

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include TestHelper
  config.expect_with :rspec do |c|
    c.syntax = :should
  end
end
