class AuthorReference < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :author, references: :users, null: false, foreign_key: { to_table: :users }
    add_reference :likes, :author, references: :users, null: false, foreign_key: { to_table: :users }
    add_reference :comments, :author, references: :users, null: false, foreign_key: { to_table: :users }
  end
end
