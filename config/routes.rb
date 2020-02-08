Rails.application.routes.draw do
  root "static#home"
  get "/signin", to: "sessions#new"
  post "/signin", to: "sessions#create"
  get "/signout", to: "sessions#destroy"
  resources :posts
  resources :languages
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy], param: :slug
end
