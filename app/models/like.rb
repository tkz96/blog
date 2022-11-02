class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  validates :user_id, uniqueness: { scope: :post_id }

  after_save :update_counter

  def update_counter
    post.increment!(:likes_counter)
  end
end
