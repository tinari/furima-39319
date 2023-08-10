Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
 root to: "items#index"


 resources :articles
<<<<<<< Updated upstream
 resources :items, only: [:new, :create, :show]
=======
 resources :items, only: [:new, :create, :show, :edit, :update]
>>>>>>> Stashed changes
 resources :users, only: [:new, :create]
end
