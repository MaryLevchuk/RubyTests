#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Header
  include PageObject

  element(:header, :nav, :xpath => '//*[@id="app"]/div/nav')
  div(:current_account, :xpath => '//*[@id="app"]/div/nav/div[1]')
  div(:next_delivery_date, :xpath => '//*[@id="app"]/div/nav/div[2]')
  div(:new_employee_message, :xpath => '//*[@id="app"]/div/nav/div[3]')
  div(:add_employee, :xpath => '//*[@id="app"]/div/nav/div[4]')
  div(:search, :xpath => '//*[@id="app"]/div/nav/div[5]')

  def is_header_present?
    header?
  end

  def account_info_is_present
    account_info?
  end


  def next_delivery_date_is_present
  next_delivery_date?
end


end
