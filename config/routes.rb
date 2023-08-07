Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
 root to: "items#index"


 resources :articles
 resources :items, only: [:new, :create]
 resources :users, only: [:new, :create]
end
