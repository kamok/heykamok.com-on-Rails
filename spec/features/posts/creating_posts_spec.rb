require 'rails_helper'
require 'helpers/posts_helper'

feature 'Creating Posts' do
  before do
    sign_in(FactoryGirl.create(:user))

    visit '/blog'

    click_link 'New Post'
  end

  scenario 'can create a post' do
    fill_in 'Title', with: 'Ka Mok is'
    fill_in 'Body', with: 'testing a post.'
    click_button 'Create Post'

    expect(page).to have_content ('Post has been created.')
  end

  scenario "can not create a project without a name" do
    click_button 'Create Post'

    expect(page).to have_content("Post has not been created.")
    expect(page).to have_content("Title can't be blank")
  end
end