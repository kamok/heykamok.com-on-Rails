require 'rails_helper'

feature 'Friendly ID' do
  scenario "show page has the title of post in the url" do
    create_topic(title: "Organic", body: "Cocktail")
    visit "/blog/organic"

    expect(page).to have_content "Organic"
    expect(page).to have_content "Cocktail"
  end

  private

  def create_topic(args = {})
    visit "/blog/new"

    expect(page).to have_content "New Post"

    fill_in "Title", with: args[:title]
    fill_in "Body", with: args[:body]

    click_on "Create Post"
  end
end