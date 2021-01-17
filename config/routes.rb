Rails.application.routes.draw do
  get 'topics/new'
  get 'sessions/new'
  # get 'users/new'
  # get 'pages/help'
  # get 'pages/index'
  # # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root 'pages#index'
  
  root 'pages#index'
  # get 'pages/index', to: 'pages#index'
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
  
  # root to: 'topic_id/comment#index'
  resources :users
  resources :topics do
    resources :comments #, only: [:index, :show, :new, :create, :destroy, :edit, :update]
    # get 'pages/help'
    # get 'comments/new', to: 'comments#new'
    # post ' /topics/:topic_id/comments', to: 'comments#create'
    # delete '/comments', to: 'comments#destroy'
  end
  # resources :topics do
  #   resources :comments
  # end
  
end