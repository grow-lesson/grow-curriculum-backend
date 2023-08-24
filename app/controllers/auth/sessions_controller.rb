class Auth::SessionsController < DeviseTokenAuth::SessionsController
  def create
    super do |resource|
      if resource
        render_login_success(resource)
      else
        render_login_error
      end
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
