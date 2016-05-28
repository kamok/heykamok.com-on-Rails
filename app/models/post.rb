class Post < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates :title, presence: true
  

  def pretty_updated_at
    updated_at.strftime("%-m/%-d/%Y")
  end
end
