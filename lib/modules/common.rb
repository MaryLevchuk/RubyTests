#encoding:UTF-8

require 'page-object'

module Common

  include PageObject

  def present?(component)
    method = "#{component}?"
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

  def contains(*args)

  end
end
