#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Menu

  include PageObject

  link(:logo, :xpath => '//*[@id="app"]/aside/div[1]/a')
  button(:account_btn, :xpath => '//*[@id="app"]/aside/div[1]/button[1]')
  buttons(:accounts, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]/button')



def amount
  puts accounts_elements.length
end

end
