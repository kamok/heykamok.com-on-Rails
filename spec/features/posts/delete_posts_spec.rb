require 'rails_helper'
require 'helpers/posts_helper'

feature 'Deleting posts' do

  before do
    sign_in(FactoryGirl.create(:user))
  end
  
  scenario 'Deleting a project' do
    FactoryGirl.create(:post, title: 'Organic')

    visit '/blog'
    click_link 'Organic'
    click_link 'Delete Post'

    expect(page).to have_content('Post has been deleted.')
    expect(page).to have_no_content('Organic')
  end
end