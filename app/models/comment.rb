class Comments < ApplicationRecord
  belongs_to :users
  belongs_to :posts

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
