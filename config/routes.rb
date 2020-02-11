Rails.application.routes.draw do
  root "static#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"

  get "/users/new", to: "users#new", as: "new_user"
  post "/users/new", to: "users#create"
  get "/users/:slug", to: "users#show", as: "user"
  get "/users/:slug/edit", to: "users#edit", as: "edit_user"
  patch "/users/:slug/edit", to: "users#update"
  put "/users/:slug/edit", to: "users#update"

  get "/posts", to: "posts#index"
  
  get "/users/:slug/posts", to: "posts#index", as: "users_posts"
  get "/users/:slug/posts/new", to: "posts#new", as: "new_users_post"
  post "/users/:slug/posts/new", to: "posts#create"
  get "/users/:slug/posts/:id/edit", to: "posts#edit", as: "edit_users_post"
  patch "/users/:slug/posts/:id/edit", to: "posts#update"
  put "/users/:slug/posts/:id/edit", to: "posts#update"
end
