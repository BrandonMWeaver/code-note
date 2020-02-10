Rails.application.routes.draw do
  root "static#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  resources :posts
  resources :languages
  get "/users/new", to: "users#new", as: "new_user"
  post "/users/new", to: "users#create"
  get "/users/:slug", to: "users#show", as: "user"
  get "/users/:slug/edit", to: "users#edit", as: "edit_user"
  patch "/users/:slug/edit", to: "users#update"
  put "/users/:slug/edit", to: "users#update"
end
