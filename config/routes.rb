Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/all', to: 'user#all', as: :find_friends
  get '/users/:id', to: 'user#show', as: :user

  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end

    unauthenticated do
      root 'home#welcome', as: :unauthenticated_root
    end
  end
end
