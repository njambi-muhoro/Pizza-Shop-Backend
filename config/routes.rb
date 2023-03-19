Rails.application.routes.draw do
  resources :restaurant_pizzas, only: [:post]
  resources :restaurants, only: [:index, :show, :delete]
  resources :pizzas, only: [:index]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/pizzas", to: "pizzas#index"
  get '/restaurants', to: 'restaurants#index'
  get '/restaurants/:id', to: 'restaurants#show'
  delete '/restaurants/:id', to: 'restaurants#destroy'
  post '/restaurant_pizzas', to: 'restaurant_pizzas#create'
end
