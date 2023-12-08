class UsersController < ApplicationController
  before_action :set_user, only: %i[ show update destroy ]

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      # Check the role parameter and create associated record
      create_role_record(params[:user][:role])

      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private

  def create_role_record(role)
    case role
    when "student"
      Student.create(user: @user, name: params[:user][:name], age: params[:user][:age], is_external: params[:user][:is_external])
    when "teacher"
      Teacher.create(user: @user, name: params[:user][:name], age: params[:user][:age])
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password_digest, :name, :age, :is_external, :role)
  end
end
