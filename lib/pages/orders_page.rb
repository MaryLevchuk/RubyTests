#encoding:UTF-8

require 'page-object'
require 'open-uri'
require_relative '../../spec/spec_helper'
require_relative '../../lib/modules/header'
require_relative '../../lib/modules/menu'
require_relative '../../lib/modules/orders_status_filter'

class OrdersPage

  include PageObject
  include Header
  include Menu
  include OrdersStatusFilter

  NEXT_DELIVERY_COLOR = 'rgba(91, 192, 222, 1)'
  PLANNED_DELIVERY_COLOR = 'rgba(108, 120, 137, 1)'
  BACKORDERED_DELIVERY_COLOR = 'rgba(240, 173, 78, 1)'

  page_url 'http://vraa.dev01.creuna.net/ddv/workclothes/orders'

  paragraph(:no_matches, :xpath => '//*[@id="app"]/div/section/div/article/div/section[2]/p')
  cells(:dates, :xpath => '//*/table/tbody/tr[*]/td[6]/dl/dd')
  spans(:colors, :xpath => '//*/table/tbody/tr[*]/td[6]/dl/dd/span[1]')

  span(:account_date, :css => '#app > div > nav > div.topbar__next-delivery-notice > span')
  button(:open_menu_change_account, :css => '#app > aside > div.sidebar__main-pane > button.sidebar__account-pane-toggle')
  buttons(:accounts, :xpath => '//*[@id="app"]/aside/div[2]/div[1]/div[2]/ul/li[*]')


  def get_dates
    date = []
    dates_elements.each do |item|
      date << Date.parse(item.attribute('title'))
    end
    date
  end

  def get_colors
    color = []
    colors_elements.each do |item|
      if (item.style('background-color') == 'rgba(0, 0, 0, 0)')
        then color << 'rgba(240, 173, 78, 1)'
      else
        color << item.style('background-color')
      end
    end
    color
  end

  def compare(current_date, account_delivery_date)
    current_date <=> account_delivery_date
  end

  def check_color(color, result_of_comparing_dates)
    result = 1
    case result_of_comparing_dates
      when -1
        result = (color == BACKORDERED_DELIVERY_COLOR)
      when 0
        result = (color == NEXT_DELIVERY_COLOR)
      when 1
        result = (color == PLANNED_DELIVERY_COLOR)
    end
    result
  end

  def colors_appropriate
    common_result = true
    account_delivery_date = Date.parse(account_date)
    date = get_dates
    color = get_colors
    for i in 0..date.length do
      result_of_comparing_dates = compare(date[i], account_delivery_date)
      common_result = common_result && check_color(color[i], result_of_comparing_dates)
    end
    (common_result == 1) ? true : false
  end

  # def change_account
  #   n = accounts_elements.length
  #   sleep 1
  #   open_menu_change_account
  #   sleep 1
  #   accounts_elements[1 + Random.rand(n-1)].click()
  #   sleep 5
  # end

  # def open_orders_page
  #   open('http://vraa.dev01.creuna.net/ddv/workclothes/orders')
  # end
  #
  # def content_present?
  #   if no_matches?
  #     then change_account
  #   end
  # end

end