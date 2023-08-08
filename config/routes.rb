Rails.application.routes.draw do
  resources :user_stocks, only: [:create]
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'my_portfolio', to: "users#my_portfolio"
  root "welcome#index"
  get "search_stock", to: "stocks#search" 
end
