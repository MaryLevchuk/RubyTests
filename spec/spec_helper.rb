#encoding: UTF-8

require 'rspec'
require 'selenium-webdriver'

RSpec.configure do |config|
  config.include PageObject::PageFactory

  config.before :all do
    @browser = Selenium::WebDriver.for :chrome  #:firefox #Watir::Browser.new :chrome
    @browser.manage.window.maximize
    #@browser = Watir::Browser.new :chrome
    #@browser.window.maximize
  end

  config.after :all do
    @browser.close
  end
end
