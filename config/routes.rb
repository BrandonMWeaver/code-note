Rails.application.routes.draw do
  resources :posts
  resources :languages
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy]
end
