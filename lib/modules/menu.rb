#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'
require_relative '../../lib/modules/header'

module Menu

  include PageObject
  include Header

  link(:logo, :xpath => '//*[@id="app"]/aside/div[1]/a')
  button(:account, :xpath => '//*[@id="app"]/aside/div[1]/button[1]')
  list_items(:workclothes_linnen_reports, :xpath => '//*[@id="app"]/aside/div[1]/nav/ul/li[*]')
  button(:contact, :xpath => '//*[@id="app"]/aside/div[1]/button[3]')
  button(:settings, :xpath => '//*[@id="app"]/aside/div[1]/button[4]')
  button(:toggle_pane, :xpath => '//*[@id="app"]/aside/div[1]/button[2]')


end
