#encoding:UTF-8

require 'page-object'
require_relative '../../lib/modules/common'

module Header

  include PageObject
  include Common

  element(:header, :nav, :xpath => '//*[@id="app"]/div/nav')
  div(:account_info, :xpath => '//*[@id="app"]/div/nav/div[1]')
  div(:next_delivery_date, :xpath => '//*[@id="app"]/div/nav/div[2]')
  div(:new_employee_message, :xpath => '//*[@id="app"]/div/nav/div[3]')
  link(:add_employee_button, :xpath => '//*[@id="app"]/div/nav/div[4]/a')
  button(:search_button, :xpath => '//*[@id="app"]/div/nav/div[5]/button')
  form(:search_form, :xpath => '//*[@id="app"]/div/nav/div[5]/form')

 def check_visibility
    search_button
    sleep 1
    visible? :search_form
 end
end
