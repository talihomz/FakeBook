Rails.application.routes.draw do
  resources :posts
  resources :comments, only: [:create]

  devise_for :user, :controllers => {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  get '/users/all', to: 'user#all', as: :find_friends
  get '/users/:id', to: 'user#show', as: :user
  get '/users/:id/edit', to: 'user#edit', as: :edit_user

  post '/posts/like', to: 'likes#create', as: :like_post
  delete '/posts/:id/unlike', to: 'likes#destroy', as: :unlike_post

  get '/notifications/', to: 'notification#index', as: :notifications
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
