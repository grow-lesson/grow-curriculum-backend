# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :authenticate_api_user!
  
  def update_profile
    user = current_api_user
    if user.update(user_profile_params)
      render json: { status: 201, message: 'Profile updated successfully' }
    else
      render json: { status: 400, message: user.errors.full_messages.join(', ') }
    end
  end

  private

  def user_profile_params
    params.require(:user).permit(:username, :name, :last_name_kana, :first_name_kana, :email, :hobbies, :languages, :bio)
  end  
end
