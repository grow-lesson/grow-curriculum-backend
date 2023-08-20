class Api::Sessions::RegistrationsController < ApplicationController
  respond_to :json

  def create
    build_resource(sign_up_params)

    if resource.save
      # トークンの生成と保存
      token = SecureRandom.hex(32) # 乱数によるトークン生成
      resource.update(auth_token: token)
      sign_in(resource)
      render json: resource
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
