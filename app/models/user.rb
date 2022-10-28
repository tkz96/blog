class User < ApplicationRecord
  has_many :posts, foreign_key: 'author_id'
  has_many :likes
  has_many :comments

  validates :name, presence: true
  validates :posts_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    # posts.last(3)
    posts.order(created_at: :desc).limit(3)
    # Post.order(created_at: :desc).limit(3)
    # Post.find_by_sql("SELECT posts.* FROM posts WHERE posts.author_id = ":2" LIMIT 3")
  end
end
