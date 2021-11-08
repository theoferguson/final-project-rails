Rails.application.routes.draw do
  resources :offerings
  resources :users

  post "/login", to: "sessions#create"

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  delete "/logout", to: "sessions#destroy"
end
