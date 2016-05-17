class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true

  def self.reading_list
    Post.first
  end
  
end
