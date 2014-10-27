#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Header
  include PageObject

  element(:header, :nav, :xpath => '//*[@id="app"]/div/nav')
  div(:current_account, :xpath => '//*[@id="app"]/div/nav/div[1]')
  div(:next_delivery_date, :xpath => '//*[@id="app"]/div/nav/div[2]')
  div(:new_employee_message, :xpath => '//*[@id="app"]/div/nav/div[3]')
  link(:add_employee_button, :xpath => '//*[@id="app"]/div/nav/div[4]/a')
  button(:search_button, :xpath => '//*[@id="app"]/div/nav/div[5]/button')
  form(:search_form, :xpath => '//*[@id="app"]/div/nav/div[5]/form')

  def present?(header_component)
    method = "#{header_component}?"
    result = send(*method)
    result
  end

    def clickable?(item)
    item_to_check = "#{item}_element"
    result = send(*item_to_check)
    result.attribute('href') != ''
  end

  def visible?(item)
    item_to_check = "#{item}_element"
    result = send(*item_to_check)
    result.visible?
  end

  def check_visibility
    search_button
    sleep 1
    visible? :search_form
  end
end
