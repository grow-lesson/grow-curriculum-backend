Rails.application.routes.draw do
  # Devise Token Authの設定
  mount_devise_token_auth_for 'User', at: 'auth'

  # Deviseの設定（sessionsとregistrationsをスキップ）
  devise_for :users, skip: [:sessions, :registrations]

  # 新規登録用のルーティングを追加
  devise_scope :user do
    post '/sign_up', to: 'api/registrations#create'
  end

  # API用のルーティング（namespaceを追加）
  namespace :api, defaults: { format: :json } do
    resources :users, only: [:show]
    devise_scope :user do
      post '/login', to: 'sessions/sessions#create'
    end
  end
end
