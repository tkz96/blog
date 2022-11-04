class Post < ApplicationRecord
  belongs_to :user, counter_cache: true, optional: true
  has_many :comments, dependent: :destroy, foreign_key: :post_id
  has_many :likes, dependent: :destroy, foreign_key: :post_id

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_count, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_count

  def update_count
    user.increment!(:posts_count)
  end

  def recent_comments(post)
    post.comments.order(created_at: :desc).limit(5)
  end
end
