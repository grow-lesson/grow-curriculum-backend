class Api::Sessions::RegistrationsController < DeviseTokenAuth::RegistrationsController
  respond_to :json

  def create
    super do |resource|
      if resource.persisted?
        render json: resource
      else
        render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
