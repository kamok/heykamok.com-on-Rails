require 'rails_helper'

RSpec.describe "reading_lists/edit", type: :view do
  before(:each) do
    @reading_list = assign(:reading_list, ReadingList.create!(
      :title => "MyString",
      :body => "MyString"
    ))
  end

  it "renders the edit reading_list form" do
    render

    assert_select "form[action=?][method=?]", reading_list_path(@reading_list), "post" do

      assert_select "input#reading_list_title[name=?]", "reading_list[title]"

      assert_select "input#reading_list_body[name=?]", "reading_list[body]"
    end
  end
end
