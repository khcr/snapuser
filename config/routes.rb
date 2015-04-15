Rails.application.routes.draw do

  get 'profile', to: "users#profile"

  patch 'user/update', to: "users#update"
  get 'user/edit', to: "users#edit"
  
  get 'login', to: "sessions#new"
  delete 'signout', to: 'sessions#destroy'
  resources :sessions, only: [:create]

  namespace :admin do

    resources :users, except: [:show]

  end
end
