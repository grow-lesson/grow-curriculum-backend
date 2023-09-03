class Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  def create
    user = User.new(sign_up_params) # Userモデルのインスタンスを生成し、属性を設定する

    if user.save
      render_create_success(user)
    else
      render_create_error(user)
    end
  end

  # ユーザー情報を更新するアクション
  def update
    if current_user.update(update_params)
      render_update_success(current_user)
    else
      render_update_error(current_user)
    end
  end
  
  private

  def render_update_success(user)
    render json: {
      status: 200,
      data: resource_data(user),
    }
  end

  def render_update_error(user)
    render json: {
      status: 422, # ユーザー情報の更新エラーはHTTPステータスコード422 (Unprocessable Entity)を返すのが一般的です
      errors: user.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def update_params
    params.permit(:username, :name, :email, :password, :password_confirmation, :last_name_kana, :first_name_kana, :hobbies, :languages, :bio)
  end

  def render_create_success(user)
    render json: {
      status: 201,
      data: resource_data(user),
    }
  end

  def render_create_error(user)
    render json: {
      status: 401,
      errors: user.errors.full_messages,
    }, status: :unprocessable_entity
  end

  def sign_up_params
    params.permit(:username, :name, :email, :password, :last_name_kana, :first_name_kana)
  end
end
