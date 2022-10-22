class Likes < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  # A method that updates the likes counter for a post.
  def update_comments_counter
    post.increment!(:likes_counter)
  end
end
