#encoding:UTF-8

require 'page-object'

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

  def filter_focused?
    account_btn
    sleep 3

    result = execute_script("return $('input.ng-valid:nth-child(1)').is(':focus')")
    #(result == 'rgb(102, 175, 233)')
    result
  end

  def collapsed_menu

  end
end
