class Api::Sessions::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    super do |resource|
      if resource.persisted?
        render json: {
          message: 'ログインに成功しました',
          status: 201,
        }, status: :ok
      else
        render json: {
          error: 'ログインに失敗しました',
          status: 401,
        }, status: :unauthorized
      end
    end
  end
end
