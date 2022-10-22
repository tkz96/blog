class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }

  # A method that updates the posts counter for a user.
  def update_posts_counter
    user.increment!(:posts_counter)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    comments.last(5)
  end
end
