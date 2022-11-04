Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :create, :new] do
      resources :comments, only: [:index, :create, :new]
        resources :likes, only: [:create]
    end
  end
    root to: 'users#index'
end
