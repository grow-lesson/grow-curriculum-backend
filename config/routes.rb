Rails.application.routes.draw do
  namespace :auth do
    mount_devise_token_auth_for 'User', at: 'auth'
  end
end

