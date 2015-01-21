Rails.application.routes.draw do

  root 'home#welcome'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy', as: :logout
  
    resources :apps
    resources :deploy
    resources :users
 

end
