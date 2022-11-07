# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, counter_cache: true, optional: true

  after_save :update_count

  def update_count
    post.increment!(:comments_count)
  end
end
