require "rails_helper"

RSpec.describe ReadingListsController, type: :routing do
  describe "routing" do

    it "routes /reading-list to pages#reading_list" do
      expect(:get => "/reading-lists").to route_to("pages#reading_list")
    end

    it "routes /reading-list/edit to reading_list#edit"
      expect(:get => "/reading-list/edit").to route_to("reading_list#edit")

  end
end
