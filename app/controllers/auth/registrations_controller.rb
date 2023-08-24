class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    user = User.new(sign_up_params) # Userモデルのインスタンスを生成し、属性を設定する

    if user.save
      render_create_success(user)
    else
      render_create_error(user)
    end
  end
  
  private

  def render_create_success(user)
    render json: {
      status: 'success',
      data: resource_data(user),
    }
  end

  def render_create_error(user)
    render json: {
      status: 'error',
      errors: user.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.permit(:username, :name, :email, :password, :last_name_kana, :first_name_kana)
  end
end
