class Api::Sessions::SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token, only: :create
  respond_to :json

  def create
    user = User.find_by(name: params[:name])

    if user&.valid_password?(params[:password])
      sign_in(user)
      render json: { message: 'ログインに成功しました' }, status: :ok
    else
      render json: { error: 'ログインに失敗しました' }, status: :unauthorized
    end
  end
end

