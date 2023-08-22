Rails.application.routes.draw do
  # Devise Token Authの設定
  mount_devise_token_auth_for 'User', at: 'auth'
end

