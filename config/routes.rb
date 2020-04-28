Rails.application.routes.draw do
  # resources :item_categories
  # resources :categories
  resources :bids, only: [:new, :create, :edit, :update]
  resources :items
  
  resources :users do
  	resources :items	
  end

  get "/login" => "sessions#new"
  resources :sessions, only: [:create]


   # get "/users/:id/items" => "users#items"
  # get "/home" => "users#home"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
