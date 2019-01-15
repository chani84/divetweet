Rails.application.routes.draw do
  devise_for :users
  root 'toppages#index'
  resources :toppages , only: [:index]
  resources :tweets , only: [:new]
end
