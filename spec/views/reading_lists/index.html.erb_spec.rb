require 'rails_helper'

RSpec.describe "reading_lists/index", type: :view do
  before(:each) do
    assign(:reading_lists, [
      ReadingList.create!(
        :body => "Body"
      ),
      ReadingList.create!(
        :body => "Body"
      )
    ])
  end

  it "renders a list of reading_lists" do
    render
    assert_select "tr>td", :text => "Body".to_s, :count => 2
  end
end
