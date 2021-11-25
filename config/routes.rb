Rails.application.routes.draw do
  scope module: :api do
    resources :posts
    resources :offerings
    resources :users
    resources :messages

    get "/me", to: "users#show"
    post "/signup", to: "users#create"

    get "/me/offerings", to: "offerings#foruser"

    get "/me/inbox", to: "users#inbox"
    get "/me/outbox", to: "users#outbox"

    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
  end

  get "*path", to: "fallback#index", constraints: ->(req) { !req.xhr? && req.format.html? }

end
