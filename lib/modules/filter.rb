#encoding:UTF-8

require 'page-object'
require_relative '../../spec/spec_helper'

module Filter
  include PageObject

  #element(:st_filters, :fieldset, :css => '#app > div > section > div > article > div > aside > form.orders-filter.ng-pristine.ng-valid > fieldset:nth-child(2)')
  paragraphs(:filters, :class => 'checkbox')

  def get_status_filters
    status_filters = []

    for i in 8..10
      status_filters << filters_elements[i]
    end
    status_filters
  end

  def parse_to_separate_data(filters)
    array_of_hashes = []
    filters.each do |filter|
      name = filter.label_element(:class => 'ng-binding').attribute('for')
      sleep 5
    end
    array_of_hashes.length
  end


end
