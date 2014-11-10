#encoding: UTF-8

require 'rspec'
require 'selenium-webdriver'
require_relative '../lib/modules/common'
require_relative '../lib/modules/header'
require_relative '../lib/modules/menu'

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

#header

RSpec.shared_examples 'Header' do
  it 'is present' do
    expect(@current_page.present? :header).to be true
  end
  context 'contains:' do
    context 'Account info' do
      it 'present' do
        expect(@current_page.present? :account_info).to be true
      end
      it 'Account name similar to chosen in menu same one' #TODO: implement in menu module
    end

    it 'Next delivery date' do
      expect(@current_page.present? :next_delivery_date).to be true
    end

    context 'AddEmployee button' do
      it 'present' do
        expect(@current_page.present? :add_employee_button).to be true
      end
      it 'clickable' do
        expect(@current_page.clickable? :add_employee_button).to be true
      end
    end

    context 'Search button' do
      it 'present' do
        expect(@current_page.present? :search_button).to be true
      end

      it 'on click search form is visible' do
        expect(@current_page.check_visibility).to be true
      end
    end

  end

  context 'style' do
    it 'width'
    it 'height'
  end

end

#menu
RSpec.shared_examples 'Menu' do
  it 'is present' do
    expect(@current_page.present? :account_btn).to be true
  end
  context 'filter in sub-menu' do
      it 'is focused' do
        expect(@current_page.filter_focused?).to be true
      end
    end
end
