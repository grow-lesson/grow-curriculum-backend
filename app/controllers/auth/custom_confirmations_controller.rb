# app/controllers/custom_confirmations_controller.rb
class Auth:CustomConfirmationsController < DeviseTokenAuth::ConfirmationsController
  protected

  def after_confirmation_path_for(resource_name, resource)
    "https://grow-official.netlify.app/confirmation-success" # 確認成功時のリダイレクト先のURL
  end
end
