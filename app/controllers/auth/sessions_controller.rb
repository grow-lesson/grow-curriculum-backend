class Auth::SessionsController < DeviseTokenAuth::SessionsController
  private
  def destroy
    signed_out = (Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name))
    render json: { success: true, message: 'ログアウトしました' }, status: :ok if signed_out
  end

  def resource_params
    params.permit(:email, :password)
  end
end
