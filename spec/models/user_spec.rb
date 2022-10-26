require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.')
  end
  it 'name field cannot be empty' do
    @user.name = nil
    expect(@user).to_not be_valid
  end

  it 'name field cannot be blank spaces' do
    @user.name = '  '
    expect(@user).to_not be_valid
  end

  it 'name should be a string' do
    @user.name = 1
    expect(@user).to_not be_valid
  end

  it 'posts_counter cannot be less than 0' do
    @user.posts_counter = -1
    expect(@user).to_not be_valid
  end

  it 'photo should be string' do
    @user.photo = 1
    expect(@user).to_not be_valid
  end
end
