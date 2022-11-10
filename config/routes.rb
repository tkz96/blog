# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users do
    get '/users/sign_out' => 'devise/sessions#destroy', :as => :destroy_user_session
  end
  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show create new] do
      resources :comments, only: %i[index create new]
      resources :likes, only: [:create]
    end
  end
  root 'users#index'
end
