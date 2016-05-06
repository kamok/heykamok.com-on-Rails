require 'rails_helper'

feature 'Viewing Posts' do
  scenario 'Listing posts in blog' do
    post = FactoryGirl.create(:post, title: 'Organic')
    visit '/blog'
    click_link 'Organic'
    expect(page.current_url).to eql(post_url(post))
  end
end