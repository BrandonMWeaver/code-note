Rails.application.routes.draw do
  root "static#home"
  resources :posts
  resources :languages
  resources :users, only: [:new, :create, :show, :edit, :update, :destroy], param: :slug
end
