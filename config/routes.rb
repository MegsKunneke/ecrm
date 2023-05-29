Rails.application.routes.draw do
  root 'home#index'

  # Devise routes
  devise_for :users

  # Custom routes
  get '/dashboard', to: 'dashboard#index'
  get '/admin/users', to: 'admin_users#index'
  get '/customers', to: 'customers#index'


  # Additional routes for users
  resources :users, only: [:show, :edit, :update]
  

  # Admin Users route
  resources :admin, only: [:index]
  resources :customers, only: [:index, :new, :create, :edit, :update, :destroy]





  # Devise sign out route
  devise_scope :user do
    delete 'users/sign_out', to: 'devise/sessions#destroy'
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end
end
