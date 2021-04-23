Rails.application.routes.draw do
  root "posts#index"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }

  resources :posts, only: [:index, :show]
  resources :subscribers
  namespace :admin do
    resources :posts
  end
end
