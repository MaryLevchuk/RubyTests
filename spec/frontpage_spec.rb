#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'
require_relative '../lib/pages/frontpage'


describe 'FrontPage' do
  before :all do
    visit  FrontPage
    on(FrontPage).login_to_ddv
    sleep 5
    on(FrontPage).change_account
    sleep 3
  end

  it 'get amount' do
    on(FrontPage).amount

  end
  context 'Header' do
    it_behaves_like "Header"
  end

  context 'Content' do

  end
end