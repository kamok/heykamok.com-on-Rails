require 'rails_helper'

RSpec.describe "reading_lists/new", type: :view do
  before(:each) do
    assign(:reading_list, ReadingList.new(
      :body => "MyString"
    ))
  end

  it "renders new reading_list form" do
    render

    assert_select "form[action=?][method=?]", reading_lists_path, "post" do

      assert_select "input#reading_list_body[name=?]", "reading_list[body]"
    end
  end
end
