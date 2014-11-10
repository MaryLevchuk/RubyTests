require 'page-object'
require_relative '../../spec/spec_helper'

class FrontPage

  include PageObject
  include Menu
  include Header


  DEFAULT_CREDENTIALS = {
      'username' => 'creuna',
      'password' => 'n56dgfk9'
  }

  page_url 'http://vraa.dev01.creuna.net/ddv/'
  # page_url 'http://api.jquery.com/category/version/1.9/'

  text_field(:username, :id => 'Username')
  text_field(:password, :id => 'Password')
  button(:login, :value => 'Login')

  button(:menu_change_account, :css => '#app > aside > div.sidebar__main-pane > button.sidebar__account-pane-toggle')
  button(:choose_account, :css => '#app > aside > div.sidebar__pane > div.pane__account > div.pane__change-account > ul > li:nth-child(2) > button')

  paragraph(:no_matches, :xpath => '//*[@id="app"]/div/section/div/article/div/section[2]/p')

  RSpec.shared_examples 'NewsLine' do
    it 'is present' do
      expect(@current_page.present? :news).to be true
    end
    context 'contains:' do
      it 'news default icon' do
        expect(@current_page.present? :news_default_icon).to be true
      end
      it 'news publication date' do
        expect(@current_page.present? :news_publication_date).to be true
      end
      context 'news title' do
        it 'present' do
          expect(@current_page.present? :news_title).to be true
        end
        it 'clickable' do
          expect(@current_page.clickable? :news_title).to be true
        end
      end

      it 'news description' do
        expect(@current_page.present? :news_description).to be true
      end
      it 'arrow-right' do
        expect(@current_page.present? :arrow_right).to be true
      end
      it 'go-to-news-overview link' do
        # expect(@current_page.(if there is more than 3 news show link )).to be true
      end


    end
    end

  def login_to_ddv(credentials = {})
    credentials = DEFAULT_CREDENTIALS.merge(credentials)
    self.username = credentials['username']
    self.password = credentials['password']
    login
  end






end