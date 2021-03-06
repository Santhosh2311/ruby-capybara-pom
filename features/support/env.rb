require 'capybara/cucumber'
#require 'capybara-screenshot/cucumber'
require 'selenium/webdriver'
require 'uri'
require 'page-object'
require 'rspec'
require 'yaml'
require_relative '../helpers/configuration.rb'

# Tell FireFox to use proxy settings
if ENV['http_proxy']
  Capybara.register_driver :selenium do |app|
    profile = Selenium::WebDriver::Firefox::Profile.new

    uri = URI(ENV['http_proxy'])

    profile["network.proxy.type"] = 1 # manual proxy config
    profile["network.proxy.http"] = uri.host
    profile["network.proxy.http_port"] = uri.port

    if ENV['https_proxy']
      uri = URI(ENV['https_proxy'])
      profile["network.proxy.https"] = uri.host
      profile["network.proxy.https_port"] = uri.port
    end
    path = './features/driver'
    Capybara::Selenium::Driver.new(app, :profile => profile, :driver_path => path)
  end
end

Capybara.default_driver = :selenium

class Screen
  include Capybara::DSL
  include RSpec::Matchers
end
