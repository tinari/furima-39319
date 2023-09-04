Rails.application.routes.draw do
  get 'caards/new'
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"


 resources :articles
 resources :users, only: [:new, :create]
 resources :caards, only: [:new, :create]
 resources :items do
      resources :buys, only: [:index, :create]
 end
 
end
