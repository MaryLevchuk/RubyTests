#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'
require_relative '../lib/pages/frontpage'
require_relative '../lib/pages/orders_page'



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
       expect(on(OrdersPage).present? :header).to be true
     end
     context 'contains:' do
       context 'Account info' do
         it 'present' do
           expect(on(OrdersPage).present? :account_info).to be true
         end
         it 'Account name similar to chosen in menu same one' #TODO: implement in menu module
       end

       it 'Next delivery date' do
         expect(on(OrdersPage).present? :next_delivery_date).to be true
       end

       context 'AddEmployee button' do
         it 'present' do
           expect(on(OrdersPage).present? :add_employee_button).to be true
         end
         it 'clickable' do
           expect(on(OrdersPage).clickable? :add_employee_button).to be true
         end
       end

       context 'Search button' do
         it 'present' do
           expect(on(OrdersPage).present? :search_button).to be true
         end

         it 'on click search form is visible' do
           expect(on(OrdersPage).check_visibility).to be true
         end
       end

     end

     # TODO context 'style' do
     #   it 'width'
     #   it 'height'
     # end

  end
  context 'Menu' do
     it 'is collapsed'   #expanded/collapsed

  end
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