require 'rails_helper'

describe PostsController do
  describe '#create' do
    it 'saves a new post in the database' do
      expect {FactoryGirl.create(:post)}.to
      change(Post, :count).by 1
    end
  end
end


