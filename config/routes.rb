Rails.application.routes.draw do
  get 'home/index'
  devise_for :views
  root to: "home#index"
end
