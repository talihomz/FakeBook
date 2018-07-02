Rails.application.routes.draw do
  get 'friends/index'

  get 'friends/destroy'

  resources :friend_requests, only: [:create, :update, :destroy]
  resources :posts
  resources :comments, only: [:create]

  devise_for :user, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/users/all', to: 'user#all', as: :find_friends
  get '/users/:id', to: 'user#show', as: :user
  get '/users/:id/edit', to: 'user#edit', as: :edit_user
  get '/users/:id/friends', to: 'friends#index', as: :friends

  post '/posts/like', to: 'likes#create', as: :like_post
  delete '/posts/:id/unlike', to: 'likes#destroy', as: :unlike_post

  get '/friend_requests/', to: 'friend_requests#index', as: :requests

  get '/privacy_policy', to: 'static_pages#privacy', as: :privacy

  match "*path", to: "application#render_404", via: :all

  devise_scope :user do
    authenticated :user do
      root 'static_pages#index', as: :authenticated_root
    end

    unauthenticated do
      root 'users/sessions#new', as: :unauthenticated_root
    end
  end
end
