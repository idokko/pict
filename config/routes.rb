Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  # get 'users/new'
  # get 'pages/help'
  # get 'pages/index'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'pages#index'
  
  root 'pages#index'
  get 'pages/help'
  
  resources :users
  
  get     '/login',   to: 'sessions#new'
  post    '/login',   to: 'sessions#create'
  delete  '/logout',  to: 'sessions#destroy'
  
  resources :users
  resources :topics
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'
  
  resources :users
  resources :topics
  
  get 'comments/index'
  post '/comments', to: 'comments#create'
  delete '/comments', to: 'comments#destroy'
end
