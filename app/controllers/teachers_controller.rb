class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show update destroy]
  skip_before_action :authorized, only: %i[create]

  # GET /teachers
  def index
    @teachers = Teacher.all

    render json: @teachers.as_json(only: %i[id name age])
  end

  # GET /teachers/1
  def show
    render json: @teacher
  end

  # POST /teachers
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token(user_id: user.id)
      teacher = Teacher.new(teacher_params)
      teacher.user = user

      if teacher.save
        class_ids = params[:teacher][:class_ids]

        teacher.mathilda_classes << MathildaClass.where(id: class_ids)

        render json: { teacher:, token: }, status: :created, location: teacher
      else
        user.destroy
        render json: teacher.errors, status: :unprocessable_entity
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /teachers/1
  def update
    if @teacher.update(teacher_params)
      class_ids = params[:teacher][:class_ids]
      @teacher.mathilda_classes = MathildaClass.find(class_ids)
      render json: @teacher.as_json(only: %i[name age], include: {
                                      mathilda_classes: { only: %i[id name] }
                                    }), status: :ok, location: @teacher
    else
      render json: @teacher.errors, status: :unprocessable_entity
    end
  end

  # DELETE /teachers/1
  def destroy
    @teacher.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def teacher_params
    params.require(:teacher).permit(:name, :age, :class_ids)
  end
end
