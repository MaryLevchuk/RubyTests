#encoding:UTF-8

require 'page-object'
require_relative '../../../spec/spec_helper'

module AccountSubMenu

  include PageObject


  div(:account_info, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[1]')
  list_items(:service_menu, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/nav/ul/li[*]')
  list_item(:filter, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[1]')
  list_items(:choose_account, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]')

  def choose_random_account
    current_account = ''
    n = 1 + Random.rand(choose_account_elements.length -1)
    choose_account_element[n].click()
    current_account = choose_account_element[n].attribute('innerText')
    current_account
  end


end
