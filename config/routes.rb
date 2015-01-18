Rails.application.routes.draw do
  resources :apps do
   resources :deploy
  end
end
