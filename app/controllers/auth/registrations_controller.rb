class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    # ユーザーを新規作成するためのリソースを生成
    build_new_auth_resource

    # パラメータを設定
    resource.assign_attributes(sign_up_params)

    # 保存を試みる
    if resource.save
      render_create_success
    else
      render_create_error(resource)
    end
  end

  private

  def render_create_success
    render json: {
      status: 'success',
      data: resource_data(resource),
    }
  end

  def render_create_error(resource)
    render json: {
      status: 'error',
      errors: resource.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.permit(:username, :name, :email, :password, :last_name_kana, :first_name_kana)
  end
end
