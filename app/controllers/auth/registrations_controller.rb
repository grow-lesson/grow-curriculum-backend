class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def render_create_success
    render json: {
      status: 'success',
      data: resource_data(resource),
    }
  end

  def render_create_error
    render json: {
      status: 'error',
      errors: resource.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.permit(:username, :name, :email, :password, :last_name_kana, :first_name_kana)
  end
end
