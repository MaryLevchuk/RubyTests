require 'page-object'
require_relative '../../spec/spec_helper'
require_relative '../../lib/modules/header'
require_relative '../../lib/modules/menu'

class FrontPage

  include PageObject
  include Menu
  include Header


  DEFAULT_CREDENTIALS = {
      'username' => 'creuna',
      'password' => 'n56dgfk9'
  }

  page_url 'http://vraa.dev01.creuna.net/ddv/'

  text_field(:username, :id => 'Username')
  text_field(:password, :id => 'Password')
  button(:login, :value => 'Login')

  button(:menu_change_account, :css => '#app > aside > div.sidebar__main-pane > button.sidebar__account-pane-toggle')
  button(:choose_account, :css => '#app > aside > div.sidebar__pane > div.pane__account > div.pane__change-account > ul > li:nth-child(2) > button')

  paragraph(:no_matches, :xpath => '//*[@id="app"]/div/section/div/article/div/section[2]/p')

  def login_to_ddv(credentials = {})
    credentials = DEFAULT_CREDENTIALS.merge(credentials)
    self.username = credentials['username']
    self.password = credentials['password']
    login
  end






end