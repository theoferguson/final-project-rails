Rails.application.routes.draw do
  resources :posts
  resources :offerings
  resources :users

  post "/login", to: "sessions#create"

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  get "/me/offerings", to: "offerings#foruser"

  delete "/logout", to: "sessions#destroy"
end
