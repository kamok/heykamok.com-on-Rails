require 'rails_helper'

feature 'Creating Posts' do
  before do
    visit 'users/sign_in'
    fill_in 'Email', with: 'organic@gmail.com'
    fill_in 'Password', with: 'cocktail'
    click_button 'Log in'

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