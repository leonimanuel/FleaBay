Rails.application.routes.draw do

  # resources :item_categories
  # resources :categories
  get "/" => "auctions#index"

  resources :bids, only: [:new, :create, :edit, :update]
  resources :items
  # post "/conditions" => "auctions#conditions"
  
  resources :auctions, only: [:index, :show] do
    # get "/:condition" => "auctions#index"
  end
  get "/auctions/:condition" => "auctions#index"

  resources :users do
	  resources :auctions
    resources :bids, only: [:index]
    resources :items
    get "/purchases" => "users#purchases"	
  end

  resources :sessions
  get "/auth/facebook/callback" => "sessions#create"
  get "/login" => "sessions#login"
  get "/signup" => "sessions#signup"
  
  post "/login" => "sessions#create_login"
  post "/signup" => "sessions#create_signup"
  # get "/signup" => "sessions#new"
  # resources :sessions, only: [:new, :create, :edit, :update]
  delete "/logout" => "sessions#delete"
  # delete "/logout" => "sessions"

   # get "/users/:id/items" => "users#items"
  # get "/home" => "users#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
