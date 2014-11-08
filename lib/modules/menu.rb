#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Menu

  include PageObject

  link(:logo, :xpath => '//*[@id="app"]/aside/div[1]/a')

  button(:account_btn, :xpath => '//*[@id="app"]/aside/div[1]/button[1]')
  buttons(:accounts, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]/button')
  text_area(:filter_account, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[1]/input')


  def change_account(account_number)
    account_btn
    sleep 1
    accounts_elements[account_number].click()
    sleep 5
  end

  def choose_all_accounts_one_by_one
    (1..accounts_elements.length).each do |i|
      account_btn
      sleep 1
      accounts_elements[i].click()
      sleep 5
    end
  end

  def filter_focused
    account_btn
    result = execute_script("$('#app > aside > div.sidebar__pane > div.pane__account > div.pane__change-account > ul > li:nth-child(1) > input').is('focused')")
    result
  end

  def collapsed_menu

  end
end
