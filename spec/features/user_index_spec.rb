# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users index', type: :feature do
  before(:example) do
    @subject1 = User.create(name: 'Alan Luqman', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                            bio: 'Teacher from UK.', posts_count: 0)
  end
  it 'I can see the username of all other users.' do
    visit '/'
    expect(page).to have_content(@subject1.name)
  end

  it 'I can see the profile picture for each user.' do
    visit user_path(id: @subject1.id)
    find("img[src='https://unsplash.com/photos/F_-0BxGuVvo']")
  end

  it 'I can see the number of posts each user has written.' do
    visit '/'
    expect(page).to have_content(@subject1.posts_count)
  end

  it "When I click on a user, I am redirected to that user's show page." do
    visit '/'
    click_link('Show this user')
    expect(page).to have_content(@subject1.name)
  end
end
