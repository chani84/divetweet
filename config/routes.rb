Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  resources :toppages , only: [:index]
  resources :tweets
  get 'users/:id' => 'users#show'
  get 'tweets/:id/edit' => 'tweets#edit'
  patch 'tweets/:id' => 'tweets#update'
end
