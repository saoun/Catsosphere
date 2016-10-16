Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  resources :users

  resources :posts do
    resources :comments
  end

  resources :comments do
    resources :comments
  end

  resources :conversations do
  resources :messages
 end

  root to: "posts#index"

end
