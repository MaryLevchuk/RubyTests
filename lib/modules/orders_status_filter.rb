#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module OrdersStatusFilter
  include PageObject

  checkbox(:status_next, :id => 'delivery_next')     #status_next_checked?
  checkbox(:status_planned, :id => 'delivery_planned')
  checkbox(:status_backordered, :id => 'delivery_backordered')

  span(:color_next, :class => 'status-next')
  span(:color_planned, :class => 'status-planned')
  span(:color_backordered, :class => 'status-backordered')

  def is_present?(filter_name)
    method = "#{filter_name}?"
    result = ((send(*method)) ? 1 : 0)
    result
  end

  def is_checked(filter_name)
    method = "#{filter_name}_checked?"
    result = send(*method)
    result
  end

  def get_color(filter_name)
    method = "#{filter_name}_element"
    result = send(*method).style('background-color')
    result
  end

  def status
    status = {
        'next' => is_checked(:status_next),
        'planned' => is_checked(:status_planned),
        'backordered' => is_checked(:status_backordered)
    }
    status
  end

  def color
    color = {
        'next' => get_color(:color_next),
        'planned' => get_color(:color_planned),
        'backordered' => get_color(:color_backordered)
    }
    color
  end

end