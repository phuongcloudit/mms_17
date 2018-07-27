Rails.application.routes.draw do
  root "static_pages#home"
  get "sessions/new"
  get "users/new"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  namespace :admin do
    resources :users
    resources :positions
  end
end
