Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  devise_for :views
  root to: "home#index"
end
