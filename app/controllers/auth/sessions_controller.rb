class Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    resource = resource_class.find_by(email: params[:email])

    if resource && resource.valid_password?(params[:password])
      sign_in(resource_name, resource)
      render_login_success(resource)
    else
      render_login_error
    end
  end

  private

  def render_login_success(resource)
    render json: {
      status: 'success',
      data: resource_data(resource),
    }
  end

  def render_login_error
    render json: {
      status: 'error',
      errors: ['Invalid credentials'],
    }, status: :unauthorized
  end
end
