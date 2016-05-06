require 'rails_helper'

feature 'Creating Posts' do
  scenario 'can create a post' do
    visit '/blog'

    click_link 'New Post'

    fill_in 'Title', with: 'Ka Mok is'
    fill_in 'Body', with: 'testing a post.'
    click_button 'Create Post'

    expect(page).to have_content ('Post has been created.')
  end
end