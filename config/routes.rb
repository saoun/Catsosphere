Rails.application.routes.draw do
  devise_for :models
  devise_for :users
  resources :users
  resources :posts do
    resources :comments
  end

  root to: "posts#index"

end
