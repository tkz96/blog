# frozen_string_literal: true

# rubocop:disable Style/Documentation
class UpdateDefaultPostsCounter < ActiveRecord::Migration[7.0]
  def change
    change_column_default :users, :posts_counter, default: 0, null: false
    change_column_default :posts, :likes_counter, default: 0, null: false
    change_column_default :posts, :comments_counter, default: 0, null: false
  end
end
# rubocop:enable Style/Documentation
