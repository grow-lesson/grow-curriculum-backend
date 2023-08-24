class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    build_resource(sign_up_params) # Userモデルのインスタンスを生成し、属性を設定する

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

  def render_create_error(resource) # リソースを引数として受け取る
    render json: {
      status: 'error',
      errors: resource.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.permit(:username, :name, :email, :password, :last_name_kana, :first_name_kana)
  end
end
