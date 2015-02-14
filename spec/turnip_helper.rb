require 'turnip'
require 'turnip/capybara' # to use Capybara DSL methods in steps
require 'capybara'
require 'selenium-webdriver'
require 'capybara/poltergeist'

Dir.glob( File.expand_path("../features/steps/**/*steps.rb", __FILE__) ){ |f| load f, true  }

Capybara.register_driver :selenium_chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

# the driver :selenim is set to firefox by default,
# but I like to make it explicit.
Capybara.register_driver :selenium_firefox do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :whatever_name_you_want do |app|
  Capybara::Selenium::Driver.new(app, :browser => :whatever_browser_selenium_supports)
end

Capybara.configure do |c|

  # PhantomJS
  c.javascript_driver = :poltergeist
  c.current_driver = :poltergeist
  
  # Google Chrome
  #c.javascript_driver = :selenium_chrome
  #c.current_driver = :selenium_chrome

  # FireFox
  #c.javascript_driver = :selenium_firefox
  #c.current_driver = :selenium_firefox

  # whatever_browser_selenium_supports
  #c.javascript_driver = :selenium_whatever_browser_selenium_supports
  #c.current_driver = :selenium_whatever_browser_selenium_supports

  c.app_host = "http://localhost:3000"
end
