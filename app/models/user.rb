# frozen_string_literal: true

# The user class
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable 
  has_many :posts, dependent: :destroy, foreign_key: :user_id
  accepts_nested_attributes_for :posts
  before_create :default_posts_count

  has_many :comments
  has_many :likes

  validates :name, presence: true
  # validates :posts_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def default_posts_count
    self.posts_count = 0
  end

  def return_recent_posts
    posts.order(created_at: :desc).limit(3)
  end
end
