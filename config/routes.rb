Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Sets the root of the website:
  root 'posts#index'
  # Regular routes:
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/dashboard' => 'posts#dashboard'
  get '/new' => 'posts#new'
  get '/settings' => 'users#settings'
  get '/settings/account' => 'users#account'
  get '/account' => 'users#show'
  delete '/logout' => 'sessions#destroy'
  get '/settings/account' => 'users#update'
  
  # Resources:
  resources :posts
  resources :users
  resources :sessions
  
end
