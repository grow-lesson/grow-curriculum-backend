class Auth::SessionsController < DeviseTokenAuth::SessionsController
  skip_before_action :verify_authenticity_token

  def create
    email = params[:email]
    password = params[:password]

    @resource = User.find_by(email: email)

    if @resource&.valid_password?(password) && @resource&.confirmed?
      create_token_info(@resource)
      render json: {
        status: 'success',
        data: resource_data(@resource),
      }
    else
      render_login_error
    end
  end

  private

  def render_login_error
    render json: {
      status: 'error',
      errors: ['Invalid credentials'],
    }, status: :unauthorized
  end

  def create_token_info(resource)
    @client_id = SecureRandom.urlsafe_base64(nil, false)
    @token = resource.create_token
    resource.tokens[@client_id] = {
      token: BCrypt::Password.create(@token),
      expiry: (Time.now + DeviseTokenAuth.token_lifespan).to_i,
    }
    resource.save!
  end
end
