# frozen_string_literal: true

json.extract! user, :id, :name, :photo, :bio, :posts_count, :created_at, :updated_at
json.url user_url(user, format: :json)
