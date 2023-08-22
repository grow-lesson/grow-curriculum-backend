class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  private

  def sign_up_params
    params.permit(:username, :email, :password, :last_name_kana, :first_name_kana)
    delete '/auth/sign_out', to: 'sessions#destroy' # ログアウト用のルート
  end
end
