#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Common

  include PageObject

  def present?(header_component)
    method = "#{header_component}?"
    result = send(*method)
    result
  end

  def clickable?(item)
    item_to_check = "#{item}_element"
    result = send(*item_to_check)
    result.attribute('href') != ''
  end

  def visible?(item)
    item_to_check = "#{item}_element"
    result = send(*item_to_check)
    result.visible?
  end

end
