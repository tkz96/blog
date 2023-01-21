# frozen_string_literal: true

# The user class
class User < ApplicationRecord
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  accepts_nested_attributes_for :posts

  has_many :comments
  has_many :likes

  validates :name, presence: true
  validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def return_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
