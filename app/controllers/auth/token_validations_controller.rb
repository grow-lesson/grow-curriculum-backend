# app/controllers/auth/token_validations_controller.rb
class Auth::TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  before_action :authenticate_user!

  # トークンのバリデーション処理
  def validate_token
    # キャッシュ無効化のヘッダーを設定
    response.headers['Cache-Control'] = 'no-store, no-cache, must-revalidate, max-age=0'
    # トークンが有効かを確認
    if current_user
      render_validate_token_success_response
    else
      render_validate_token_failure_response
    end
  end

  private

  # トークンが有効な場合のレスポンスを返す
  def render_validate_token_success_response
    render json: {
      status: 200,
      data: resource_data(current_user),
    }
  end

  # トークンが無効な場合のレスポンスを返す
  def render_validate_token_failure_response
    render json: {
      status: 401,
      errors: ['Invalid token'],
    }, status: :unauthorized
  end
end
