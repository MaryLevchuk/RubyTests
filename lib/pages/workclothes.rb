#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

require_relative '../../lib/modules/orders_status_filter'

class WorkclothesPage

  include PageObject
  include Header
  include Menu
  include OrdersStatusFilter

  NEXT_DELIVERY_COLOR = 'rgba(91, 192, 222, 1)'
  PLANNED_DELIVERY_COLOR = 'rgba(108, 120, 137, 1)'
  BACKORDERED_DELIVERY_COLOR = 'rgba(240, 173, 78, 1)'

  page_url 'http://vraa.dev01.creuna.net/ddv/workclothes'

end