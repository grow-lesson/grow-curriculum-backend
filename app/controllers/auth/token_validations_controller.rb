# app/controllers/auth/token_validations_controller.rb
class Auth::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  before_action :authenticate_user!

  # バリデーション処理
  def validate_token
    # トークンが有効かを確認
    if current_user
      render json: {
        success: true,
        data: resource_data(current_user),
      }
    else
      render json: {
        success: false,
        errors: ['Invalid token'],
      }, status: :unauthorized
    end
  end
end
