class Api::UsersController < ApplicationController
  before_action :authenticate_user! # Deviseの場合、ログイン済みユーザーの認証を行う

  def show
    user = current_user
    response.headers['Cache-Control'] = 'no-cache, no-store'
    response.headers['Pragma'] = 'no-cache'
    response.headers['Expires'] = '0'
    render json: user
  end
end
