#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'
require_relative '../lib/pages/frontpage'
require_relative '../lib/modules/menu'


describe 'FrontPage' do
  before :all do
    visit  FrontPage
    sleep 5
    on(FrontPage).login_to_ddv
    sleep 5
    on(FrontPage).change_account 0
    sleep 3
  end

  # it 'choose all accounts' do
  #   on(FrontPage).choose_all_accounts_one_by_one
  # end

  # context 'Header' do
  #   it_behaves_like 'Header'
  # end
  context 'Menu' do
    it_behaves_like 'Menu'
    # it 'filter focused' do
    #   expect(on(FrontPage).filter_focused?).to be true
    # end

  end
  # context 'Content' do
  #   context 'News' do
  #     # it_behaves_like 'News'
  #   end
  #   context 'EmployeesTable' do
  #
  #   end
  # end
end