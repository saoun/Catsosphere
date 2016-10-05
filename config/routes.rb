Rails.application.routes.draw do
  resources :users
  resources :posts do
    resources :comments
  end

  root to: "posts#index"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
end
