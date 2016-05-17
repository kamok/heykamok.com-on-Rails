require 'rails_helper'

RSpec.describe "reading_lists/index", type: :view do
  before(:each) do
    assign(:reading_lists, [
      ReadingList.create!(
        :title => "Title",
        :body => "Body"
      ),
      ReadingList.create!(
        :title => "Title",
        :body => "Body"
      )
    ])
  end

  it "renders a list of reading_lists" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
