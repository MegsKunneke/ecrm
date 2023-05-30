Rails.application.routes.draw do
  root 'home#index'

  # Devise routes
  devise_for :users, controllers: { registrations: 'registrations' }
  


  # Custom routes
  get '/dashboard', to: 'dashboard#index', as: 'dashboard'
  get '/profile', to: 'users#profile', as: 'user_profile'
  get '/users', to: 'users#index', as: 'users'

  resources :products


  # Additional routes for users
  resources :users


  # Admin Users route
  namespace :admin do
  resources :users, only: [:index]
  end


  # Devise sign out route
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
