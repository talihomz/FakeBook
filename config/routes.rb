Rails.application.routes.draw do
  resources :posts
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/all', to: 'user#all', as: :find_friends
  get '/users/:id', to: 'user#show', as: :user
  get '/notifications/', to: 'notification#index', as: :notifications
  get '/privacy_policy', to: 'static_pages#privacy', as: :privacy

  match "*path", to: "application#render_404", via: :all

  devise_scope :user do
    authenticated :user do
      root 'static_pages#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
end
