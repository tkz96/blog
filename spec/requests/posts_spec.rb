require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET posts#index' do
    before do
      get '/users/1/posts', params: { id: 1 }
    end
    it 'should respond with status 200' do
      expect(response).to have_http_status(200)
    end
    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
    it 'includes correct placeholder text in respond body' do
      expect(response.body).to include('This is the index for posts.')
    end
  end

  describe 'GET posts#show' do
    before do
      get '/users/1/posts', params: { id: 1 }
    end
    it 'should respond with status 200' do
      expect(response).to have_http_status(200)
    end
    it 'should render the index template' do
      expect(response).to render_template(:index)
    end
    it 'includes post' do
      expect(response.body).to include('post')
    end
  end
end
