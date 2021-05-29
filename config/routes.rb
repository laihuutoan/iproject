Rails.application.routes.draw do
  mount Ahoy::Engine => "/ahoy", as: :iproject_ahoy
  # Sidekiq Web
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  resources :comments
  root "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts, only: [:index, :show] do
    resources :comments
    collection do
      get :like
    end
  end
  resources :subscribers
  namespace :admin do
    resources :posts
  end
end
