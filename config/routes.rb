Rails.application.routes.draw do
  root "static_pages#home"
  get "sessions/new"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
end