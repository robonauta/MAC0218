Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Sets the root of the website:
  root 'posts#index'
  # Regular routes:
  get '/about' => 'pages#about'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
  
  # Resources:
  resources :posts
  resources :users
  resources :sessions
  
end
