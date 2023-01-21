# frozen_string_literal: true

# Like model
class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  validates :user_id, uniqueness: { scope: :post_id }

  after_save :update_count

  def update_count
    post.increment!(:likes_count)
  end
end
