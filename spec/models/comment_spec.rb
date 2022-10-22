require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:all) do
    @first_user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                              bio: 'Teacher from Mexico.', posts_counter: 1)
    @post = Post.new(title: 'Hello', text: 'This is my first post', likes_counter: 0, comments_counter: 0,
                     author: @first_user)
    @comment = Comment.new(text: 'Hi Tom!', author: @first_user, post: @post)
  end

  it 'creates a valid comment' do
    expect(@comment).to be_valid
  end
end
