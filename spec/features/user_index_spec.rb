require 'rails_helper'

RSpec.describe 'Hello world', type: :system do
  before do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
    visit users_path
  end
  describe 'index page' do
    it 'has usernames' do
      expect(page).to have_content(@user.name)
    end
  end
end