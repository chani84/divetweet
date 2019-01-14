Rails.application.routes.draw do
  root 'toppages#index'
  resources :toppages , only: [:index]
  resources :tweets , only: [:new]
end
