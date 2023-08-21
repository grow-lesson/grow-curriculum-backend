class Api::RegistrationsController < DeviseTokenAuth::RegistrationsController
  respond_to :json

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
