Rails.application.routes.draw do
  resources :posts
  resources :offerings
  resources :users
  resources :messages

  get "/me", to: "users#show"
  post "/signup", to: "users#create"

  get "/me/offerings", to: "offerings#foruser"

  get "/me/inbox", to: "messages#inbox"

  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
