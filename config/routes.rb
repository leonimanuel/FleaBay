Rails.application.routes.draw do

  # resources :item_categories
  # resources :categories
  resources :bids, only: [:new, :create, :edit, :update]
  resources :items
  resources :auctions, only: [:index, :show]
  
  resources :users do
	  resources :auctions
    resources :bids, only: [:index]
    resources :items
    get "/purchases" => "users#purchases"	
  end

  get "/login" => "sessions#login"
  post "/login" => "sessions#create_login"
  # get "/signup" => "sessions#new"
  # resources :sessions, only: [:new, :create, :edit, :update]
  delete "/logout" => "sessions#delete"
  # delete "/logout" => "sessions"


   # get "/users/:id/items" => "users#items"
  # get "/home" => "users#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
