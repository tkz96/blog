require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.')
    @post = Post.new(title: 'Hello', text: 'This is my first post', likes_counter: 2, comments_counter: 3,
                     author: @first_user)
  end

  it 'create a post with valid title and length' do
    expect(@post).to be_valid
  end
end
