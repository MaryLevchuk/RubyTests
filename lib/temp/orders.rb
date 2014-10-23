#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'
require_relative '../../lib/modules/orders_status_filter'

class OrdersPage

  include PageObject
  include OrdersStatusFilter

  NEXT_DELIVERY_COLOR = 'rgba(91, 192, 222, 1)'
  PLANNED_DELIVERY_COLOR = 'rgba(108, 120, 137, 1)'
  BACKORDERED_DELIVERY_COLOR = 'rgba(240, 173, 78, 1)'

  page_url 'http://vraa.dev01.creuna.net/ddv/workclothes/orders'

  #describe clothes table
  divs(:account_info, :class => 'locker-info-box')

  paragraph(:no_matches, :xpath => '//*/section[3]/p')

  cells(:dates, :xpath => '//*[@id="app"]/div/section/div/article/div/section[2]/div[*]/table/tbody/tr[*]/td[6]/dl/dd')

  span(:account_delivery_date, :css => '#app > div > nav > div.topbar__next-delivery-notice > span')
  button(:open_menu_change_account, :css => '#app > aside > div.sidebar__main-pane > button.sidebar__account-pane-toggle')
  buttons(:accounts, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]')

  def change_account
    n = accounts.length
    open_menu_change_account
    sleep 1
    # accounts_elements[1 + Random.rand(n-1)].click()
    sleep 5
  end

  def get_dates_and_colors_from_page
n = dates_elements.length
m = []
for i in 0..n do
  m[i] = dates_elements[i].span_element(:xpath =>'//*[@id="app"]/div/section/div/article/div/section[2]/div[*]/table/tbody/tr[i]/td[6]/dl/dd/span[1]').style('background-color')
  sleep 1
end


  end

  def get_account_delivery_date
    to_date = Date.parse(account_delivery_date)
    to_date
  end

  def compare(current_date, account_delivery_date, color)
sleep 1
     if current_date == account_delivery_date
        then color == NEXT_DELIVERY_COLOR
      elsif
        current_date > account_delivery_date
        then color == PLANNED_DELIVERY_COLOR
      else
        color == BACKORDERED_DELIVERY_COLOR
      end
  end

  def check_colors
    result = 1
    date, check_color = get_dates_and_colors_from_page
sleep 1
    account_delivery_date = get_account_delivery_date

    (0..date.length-1).each do |i|
      puts "row # #{i}: #{compare date[i], account_delivery_date, check_color[i]}"
sleep 1
    result = result * (compare date[i], account_delivery_date, check_color[i])
    end
    result
  end

  def compare_dates_check_colors
    if no_matches?
      then change_account
      else get_dates_and_colors_from_page
    end
  end


end