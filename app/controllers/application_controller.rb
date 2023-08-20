class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    token = request.headers['Authorization']&.split(' ')&.last
    return unauthorized unless token

    user = User.find_by(auth_token: token)
    return unauthorized unless user

    sign_in(user) # ここでユーザーをログイン状態にするなどの処理を行う

    # user をコントローラーアクション内で使用する場合、以下のように設定する
    @current_user = user
  end

  def unauthorized
    render json: { error: 'Unauthorized' }, status: :unauthorized
  end
end
