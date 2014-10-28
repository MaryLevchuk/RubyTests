#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'
require_relative '../../lib/modules/header'
require_relative '../../lib/modules/submenu/account_submenu'

module Menu

  include PageObject
  include Header
  include AccountSubMenu

  link(:logo, :xpath => '//*[@id="app"]/aside/div[1]/a')
  button(:account, :xpath => '//*[@id="app"]/aside/div[1]/button[1]')
  list_items(:workclothes_linnen_reports, :xpath => '//*[@id="app"]/aside/div[1]/nav/ul/li[*]')
  button(:contact, :xpath => '//*[@id="app"]/aside/div[1]/button[3]')
  button(:settings, :xpath => '//*[@id="app"]/aside/div[1]/button[4]')
  button(:toggle_pane, :xpath => '//*[@id="app"]/aside/div[1]/button[2]')


  def get_account_from_header
    account = current_account_element.attribute('innerText').delete('Konto')
    account
  end

  def same_accounts
    account
    current_account_in_menu = choose_random_account
    current_account_on_header = get_account_from_header
    current_account_in_menu == current_account_on_header
  end


end
