Rails.application.routes.draw do
  devise_for :users
  resources :categories
  resources :products

  namespace :admin do
    root 'admin_panel#index'
    resources :admin_panel, only: [:index, :create, :edit, :destroy]
  end

  root to: "home#index"
end
