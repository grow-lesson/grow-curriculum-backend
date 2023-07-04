Rails.application.routes.draw do
  devise_for :users
  namespace :api do
    resources :users, only: [:index]
  end
end
