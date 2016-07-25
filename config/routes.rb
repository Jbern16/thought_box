Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'sessions#new'
  resources :users, except: [:show]
  resources :links, only: [:index, :create]
  get "/login", to: 'sessions#new' 
  post "/login", to: 'sessions#create'
  delete "/logout", to: 'sessions#destroy'

end
