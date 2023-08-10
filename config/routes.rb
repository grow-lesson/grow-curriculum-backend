Rails.application.routes.draw do
  devise_for :users, skip: [:sessions, :registrations]
  
  # 新規登録用のルーティングを追加
  devise_scope :user do
    post '/sign_up', to: 'api/registrations#create'
  end
  
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show]
    devise_scope :user do
      post '/login', to: 'sessions/sessions#create'
    end
  end
end