Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get 'profile_edit', to: 'users/registrations#profile_edit', as: 'profile_edit'
    patch 'profile_update', to: 'users/registrations#profile_update', as: 'profile_update'
  end

  root 'toppages#index'
  resources :toppages , only: [:index, :show]
  resources :tweets, only: [:new, :index, :create, :edit, :update, :destroy] do
    resources :comments, only: [:index, :create]
  end
  resources :user

  get     'users/:id'       =>  'users#show'
  get     'tweets/:id/edit' =>  'tweets#edit'
  patch   'tweets/:id'      =>  'tweets#update'
  get     'tweets/search'   =>  'tweets#search'
end
