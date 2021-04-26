Rails.application.routes.draw do
  resources :comments
  root "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts, only: [:index, :show] do
    resources :comments
  end
  resources :subscribers
  namespace :admin do
    resources :posts
  end
end
