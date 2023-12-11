class AuthController < ApplicationController
  skip_before_action :authorized, only: [:login]
  rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

  def login
    @user = User.find_by!(email: login_params[:email])
    if @user.authenticate(login_params[:password])
      @token = encode_token(user_id: @user.id)
      render json: {
        user: UserSerializer.new(@user),
        token: @token,
      }, status: :accepted
    else
      render json: { message: "Incorrect email or password" }, status: :unauthorized
    end
  end

  def me
    if current_user
      user_json = current_user.as_json(only: %i[id email role])

      if current_user.role == "student"
        if current_user.student.present?
          user_json["student"] = current_user.student.as_json(only: %i[id name age], include: {
                                                                mathilda_class: { only: %i[id name] },
                                                              })
        end
      elsif current_user.role == "teacher"
        if current_user.teacher.present?
          user_json["teacher"] = current_user.teacher.as_json(only: %i[id name age], include: {
                                                                mathilda_classes: { only: %i[id name] },
                                                              })
        end
      end

      render json: user_json
    else
      render json: { error: "Please log in" }
    end
  end

  private

  def login_params
    params.require(:user).permit(:email, :password)
  end

  def handle_record_not_found(_error)
    render json: { message: "Incorrect email or password" }, status: :unauthorized
  end
end
