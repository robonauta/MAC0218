Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Sets the root of the website:
  root 'projects#index'
  # Regular routes:
  get '/about' => 'pages#about'
  get '/contact' => 'pages#contact'
  post '/contact' => 'pages#message'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  get '/new' => 'projects#new'
  get '/settings' => 'users#settings'
  get '/settings/account' => 'users#account'
  get '/account' => 'users#show'
  delete '/logout' => 'sessions#destroy'
  get '/settings/account' => 'users#update'
  get '/upload' => 'images#new'
  get '/projects' => 'projects#show'
  get '/label' => 'labels#new'
  get '/dashboard' => 'projects#dashboard'
  post 'create_question' => 'projects#create_question'
  get '/retrieve' => 'projects#retrieve'
  get '/saveanswer' => 'labels#saveanswer'
  
  # Resources:
  resources :projects
  resources :users
  resources :sessions
  resources :labels
  resources :images
  resources :question
  
end
