Rails.application.routes.draw do
  devise_for :users
  root "parks#index"
  resources :parks
  resources :users, only: [:show]
end
