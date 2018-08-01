Rails.application.routes.draw do
  root "static_pages#home"
  get "sessions/new"
  get "/help", to: "static_pages#help"
  get "/about", to: "static_pages#about"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  namespace :admin do
    resources :users
    resources :positions
    resources :teams do
      member do
         get "add-member", to: "teams#add_member"
         patch "add-member", to: "teams#update_member"
      end
    end
    resources :projects
    resources :skills
  end
end
