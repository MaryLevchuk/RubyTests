#encoding: UTF-8

require 'page-object'
require_relative 'spec_helper'


shared_examples_for 'Menu link' do |page|
  context "#{page}" do
    it 'present'
    it 'clickable'
    it "leads to #{page}"
    it 'arrow-selected if active'

  end

end

shared_examples_for 'Menu button' do |button|
  it 'present'
  context 'on click' do
    context "sub menu #{button}" do
      it 'opened'
      it 'closed'
    end
  end

 end

shared_examples_for 'General Frontend Rules' do |width, height|
  context 'have the same' do

      it "width should be equal to #{width}"
      it "height should be equal to #{height}"

  end

  context 'contains' do
    it 'icon'
  end

end

shared_examples_for 'Expanded link' do
  context 'contains' do
    it 'menu name'
    it 'arrow if selected'
  end
end

shared_examples_for 'Expanded button' do
  context 'contains' do
    it 'menu name'
    it 'arrow-shevron-right'

  end

end


describe 'Menu' do
  context 'expanded' do
    context 'contains' do
      context 'Logo' do
        it_should_behave_like "Menu link", 'Homepage'
        context 'has' do
          it 'width'
          it 'height'
        end
      end

      context 'Account button' do
        it_should_behave_like "Menu button", 'Account'
        it_should_behave_like "General Frontend Rules", 280, 70
        it_should_behave_like "Expanded button"
        it 'contains current account name'
        it 'has blue background color'
        it 'account is the same as on the header'
      end

      context 'Workclothes' do
        it_should_behave_like "Menu link", 'Workclothes'
        it_should_behave_like "General Frontend Rules"
        it_should_behave_like "Expanded link"
      end

      context 'Linnen' do
        it_should_behave_like "Menu link", 'Linnen'
        it_should_behave_like "General Frontend Rules"
        it_should_behave_like "Expanded link"
      end

      context 'Reports' do
        it_should_behave_like "Menu link", 'Reports'
        it_should_behave_like "General Frontend Rules"
        it_should_behave_like "Expanded link"
      end

      context 'Contact button' do
        it_should_behave_like "Menu button", 'Contact'
        it_should_behave_like "General Frontend Rules"
        it_should_behave_like "Expanded button"
      end

      context 'Settings button' do
        it_should_behave_like "Menu button", 'Settings'
        it_should_behave_like "General Frontend Rules"
        it_should_behave_like "Expanded button"
        it 'contains logged in user name'
    end
    end
  end

  context 'collapsed' do
    context 'contains' do
      context 'Logo' do
        it_should_behave_like "Menu link", 'Homepage'

      end

      context 'Account button' do
        it_should_behave_like "Menu button", 'Account'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Workclothes' do
        it_should_behave_like "Menu link", 'Workclothes'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Linnen' do
        it_should_behave_like "Menu link", 'Linnen'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Reports' do
        it_should_behave_like "Menu link", 'Reports'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Toggle button' do
        it_should_behave_like "Menu button", 'Contact'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Contact button' do
        it_should_behave_like "Menu button", 'Contact'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end

      context 'Settings button' do
        it_should_behave_like "Menu button", 'Settings'
        it_should_behave_like "General Frontend Rules", 80.500, 70
      end
    end


  end
end