require 'rails_helper'

RSpec.describe 'renders post index Page', type: :feature do
  before(:example) do
    @subject1 = User.create(name: 'Alan Luqman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from UK.', posts_count: 0)
    @subject2 = User.create(name: 'Alex', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from USA.',
                            posts_count: 0)
    @post = Post.create(user: @subject1, title: 'nick', text: 'nick start new role as web developer', comments_count: 0, likes_count: 0)
    @comment = Comment.create(text:'Hello', user_id: @subject2.id, post_id: @post.id)

    visit "/users/#{@subject1.id}/posts/#{@post.id}"
  end

  it 'I can see the post title.' do
    expect(page).to have_content(@post.title)
  end

  it 'I can see who wrote the post.' do
    expect(page).to have_content(@post.user.name)
  end

  it 'I can see how many comments it has.' do
    expect(page).to have_content(@post.comments_count)
  end

  it 'I can see how many likes it has.' do
    expect(page).to have_content(@post.likes_count)
  end

  it 'I can see the post body.' do
    expect(page).to have_content(@post.text)
  end

  it 'I can see the username of each commentor.' do
    expect(page).to have_content(@subject2.name)
  end

  it 'I can see the comment each commentor left.' do
    expect(page).to have_content('Hello')
  end
end