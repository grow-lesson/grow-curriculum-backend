Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations: 'auth/registrations',
    sessions: 'auth/sessions',
    token_validations: 'auth/token_validations',
  }
  # プロフィールの更新ルート
  put '/update_profile', to: 'users#update_profile'
end

