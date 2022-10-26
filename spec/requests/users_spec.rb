require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET users#index' do
    before do
      get '/users'
    end
    it 'should respond with status 200' do
      expect(response).to have_http_status(200)
    end
    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
    it 'includes correct placeholder text in respond body' do
      expect(response.body).to include('This is the index for users.')
    end
  end

  describe 'GET users#show' do
    before do
      get '/users/1'
    end
    it 'should respond with status 200' do
      expect(response).to have_http_status(200)
    end
    it 'should render the show template' do
      expect(response).to render_template(:show)
    end
  end
end
