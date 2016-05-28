require 'rails_helper'

describe Post do
  let(:post) { Post.create(title: "Foo", body: "Bar") }

  it { should validate_presence_of (:title) }

  describe "pretty_updated_at" do
    it "makes the updated_at date look Month/Day/Year format" do
      time = Time.local(2016, 4, 5)
      Timecop.freeze(time)

      expect(post.pretty_updated_at).to eq("4/5/2016")
    end
  end

  describe "pretty_created_at" do
    it "makes the created_at date look Month/Day/Year format" do
      time = Time.local(2017, 5, 6)
      Timecop.freeze(time)

      expect(post.pretty_created_at).to eq("5/6/2017")
    end
  end
  
end 