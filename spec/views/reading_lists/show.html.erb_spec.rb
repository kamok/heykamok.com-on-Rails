require 'rails_helper'

RSpec.describe "reading_lists/show", type: :view do
  before(:each) do
    @reading_list = assign(:reading_list, ReadingList.create!(
      :title => "Title",
      :body => "Body"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Body/)
  end
end
