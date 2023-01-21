# frozen_string_literal: true

# rubocop:disable Style/Documentation
class UpdateCounterNames < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_counter, :posts_count
    change_column_default :posts, :likes_counter, :likes_counter
    change_column_default :posts, :comments_counter, :comments_count
  end
end
# rubocop:enable Style/Documentation
