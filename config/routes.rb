Rails.application.routes.draw do
  devise_for :users

  resources :categories
  resources :products

  namespace :admin do
    root 'admin_panel#index'
    resources :admin_panel, only: [:index]
    resources :users, only: [:index, :create, :update, :destroy]
    resources :categories, only: [:index, :create, :update, :destroy]
    resources :products, only: [:index, :create, :update, :destroy]
  end

  root to: 'home#index'
end
