Rails.application.routes.draw do
  # Static page routes
  root 'static_pages#home'
  get 'help' => 'static_pages#help'
  get 'about' => 'static_pages#about'
  get 'contact' => 'static_pages#contact'
  
  # Sign up
  get 'signup' => 'users#new'
  
  # Log in
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'

  # Log out
  delete 'logout' => 'sessions#destroy'

  # Resources
  resources :users
  resources :account_activations, only: [:edit]
  resources :password_resets, only: [:new, :create, :edit, :update]
  resources :microposts, only: [:create, :destroy]
end