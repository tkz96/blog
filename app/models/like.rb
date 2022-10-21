class Likes < ApplicationRecord
    belongs_to :users
    belongs_to :posts
end