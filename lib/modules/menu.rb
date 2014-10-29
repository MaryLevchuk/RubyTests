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
    execute_script("$('#app > aside > div.sidebar__pane > div.pane__account > div.pane__change-account > ul > li:nth-child(1) > input').is('focused')")
  end

def date
  a = Date.parse('20/08/2014')
  b = Date.parse('29/10/2014')
  puts b-a
  sleep 1
end

  def collapsed_menu

  end
end
