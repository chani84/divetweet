Rails.application.routes.draw do
  root 'toppages#index'
  resources :toppages , only: [:index]
end
