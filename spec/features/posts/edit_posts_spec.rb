require 'rails_helper'
require 'helpers/posts_helper'

feature "Editing Posts" do
  
  before do
    sign_in(FactoryGirl.create(:user))
  end

  scenario "Updating a post" do
    FactoryGirl.create(:post, title: 'Organic')

    visit '/blog'
    click_link 'Organic'
    click_link 'Edit Post'
    fill_in 'Title', with: 'Simply Organic'
    click_button "Update Post"

    expect(page).to have_content ('Post has been updated.')

  end

  scenario "Updating a post with no title returns error" do
    FactoryGirl.create(:post, title: 'Organic')

    visit '/blog'
    click_link 'Organic'
    click_link 'Edit Post'
    fill_in 'Title', with: ''
    click_button "Update Post"

    expect(page).to have_content ('Post has not been updated.')
  end
end
