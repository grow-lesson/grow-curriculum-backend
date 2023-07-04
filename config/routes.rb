Rails.application.routes.draw do
  devise_for :users, skip: [:sessions]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index]
    devise_scope :user do
      post '/login', to: 'sessions/sessions#create'
    end
  end
end