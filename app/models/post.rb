class Posts < ApplicationRecord
  belongs_to :users
  has_many :likes
  has_many :comments

  # A method that updates the posts counter for a user.
  def update_posts_counter
    user.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.last(5)
  end
end
