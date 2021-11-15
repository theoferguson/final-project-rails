Rails.application.routes.draw do
  resources :posts
  resources :offerings
  resources :users

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  get "/me/offerings", to: "offerings#foruser"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
