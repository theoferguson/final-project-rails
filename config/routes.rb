Rails.application.routes.draw do
  resources :users

  get "/hello", to: "application#hello_world"

  post "/login", to: "sessions#create"

  get "/me", to: "users#show"

  delete "/logout", to: "sessions#destroy"
end
