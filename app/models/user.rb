class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    posts.last(3)
  end
end
