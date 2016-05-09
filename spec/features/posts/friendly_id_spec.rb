require 'rails_helper'

feature 'Friendly ID' do
  scenario "show page has the title of post in the url" do
    FactoryGirl.create(:post, title: 'Organic', body: "Cocktail")
    visit "/blog/organic"

    expect(page).to have_content "Organic"
    expect(page).to have_content "Cocktail"
  end
end