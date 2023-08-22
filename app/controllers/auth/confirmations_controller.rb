class CustomConfirmationsController < DeviseTokenAuth::ConfirmationsController
  protected

  def after_confirmation_path_for(resource_name, resource)
    "https://your-app.com/confirmation-success" # ここにリダイレクト先のURLを指定
  end
end
