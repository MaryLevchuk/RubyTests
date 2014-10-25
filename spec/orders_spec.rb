#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'
require_relative '../lib/pages/frontpage'
require_relative '../lib/pages/orders_page'
require_relative '../lib/modules/orders_status_filter'


describe 'OrdersPage' do
  before :all do
    visit  FrontPage
  end
  it 'Login to DDV' do
    on(FrontPage).login_to_ddv
    sleep 30
    on(FrontPage).change_account
    #sleep 3
  end

  it 'open Orders' do
    visit OrdersPage
    sleep 5
  end

  context 'Header' do
     it 'is present' do
       expect(on(OrdersPage).is_header_present?).to be true
     end
     context 'contains:' do
       context 'Account info' do
         it 'Account name similar to chosen in menu same one' do
#implement in menu module
         end
       end

       it 'next delivery date' do
         expect(on(OrdersPage).next_delivery_date_is_present).to be true
       end
       it 'AddEmployee button'
       it 'search button'
     end

     context 'style' do
       it 'width'
       it 'height'
     end

  end
  # context 'Menu' do
  #    it 'is collapsed'   #expanded/collapsed
  # end
  # context 'Info part has' do
  #    it 'title'
  #    it 'content'
  # end
  # context 'Filter section includes filters by:' do
  #   context 'All Fields'do
  #     it 'present' do
  #
  #     end
  #     it 'has title'
  #     it 'has text box for search query'
  #     it 'searching for equality between query and all fields'
  #   end
  #   context 'Delivery Dates' do
  #     context 'have' do
  #       it 'check box' do
  #
  #       end
  #       it 'status name' do
  #
  #       end
  #       it 'status color' do
  #
  #       end
  #     end
  #
  #   end
  #   context 'Costcenters'
  #   context 'Departments'
  # end
  context 'Content' do
    context 'Clothes table' do
      context 'contains' do
        it 'Employee info'
        it 'Set of clothes'
      end
      context 'Dates and colors' do
        it 'appropriate' do
         expect(on(OrdersPage).colors_appropriate).to be true
        end
      end
    end

  end
end