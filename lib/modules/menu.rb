#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Menu

  include PageObject

  link(:logo, :xpath => '//*[@id="app"]/aside/div[1]/a')

  button(:account_btn, :xpath => '//*[@id="app"]/aside/div[1]/button[1]')
  buttons(:accounts, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]/button')
  text_area(:filter_account, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[1]/input')

#elements---------------
  element(:app, :html, :css => '#app')
  element(:aside, :aside, :css => '#app > aside')
#app > aside > div.sidebar__pane > div.pane__account > div.pane__change-account > ul > li:nth-child(1) > input
#-----------------------

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

  def filter_focused?
    account_btn
    sleep 3
    result = execute_script("return $('#app aside div.pane__change-account ul li input').css('border-color')")
    (result == 'rgb(102, 175, 233)')
  end

  def get_cla
    item = execute_script("return $('#global-nav .constrain ul.links li:nth-child(2) ul li:nth-child(1) a').attr('href')")
    item
    sleep 3
  end

  def collapsed_menu

  end
end
