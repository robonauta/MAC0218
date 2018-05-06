Rails.application.routes.draw do
  get 'users/new'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Sets the root of the website:
  root 'posts#index'
  # Regular routes:
  get 'about' => 'pages#about'
  get 'login' => 'users#new'
  
  # Resources:
  resources :posts
  resources :users
  
end
