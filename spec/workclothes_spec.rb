#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'
require_relative '../lib/pages/frontpage'
require_relative '../lib/pages/workclothes'


describe 'WorkclothesPage' do
  before :all do
    visit  FrontPage
    on(FrontPage).login_to_ddv
    sleep 5
    on(FrontPage).change_account
    sleep 3
    visit WorkclothesPage
    sleep 3
  end

  context 'Header' do
    it_behaves_like "Header"
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


  end
end