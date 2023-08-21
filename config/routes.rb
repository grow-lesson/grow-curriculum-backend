Rails.application.routes.draw do
  # Devise Token Authの設定
  mount_devise_token_auth_for 'User', at: 'auth'

  # API用のルーティング（namespaceを追加）
  namespace :api, defaults: { format: :json } do
    # Devise Token Authのログイン用ルーティング
    devise_scope :user do
      post '/login', to: 'sessions/sessions#create'
    end
  end
end
