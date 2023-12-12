class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]
  before_action :set_mathilda_class, only: %i[create]
  skip_before_action :authorized, only: %i[create]

  # GET /students
  def index
    @students = Student.all

    render json: @students.as_json(only: %i[id name age is_external])
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    user = User.new(user_params)
    if user.save
      token = encode_token(user_id: user.id)
      student = Student.new(student_params)
      student.mathilda_class = @mathilda_class
      student.user = user

      if student.save
        render json: { student:, token: }, status: :created, location: student
      else
        user.destroy
        render json: student.errors, status: :unprocessable_entity
      end
    else
      render json: user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /students/1
  def update
    @student.mathilda_class = @mathilda_class
    if @student.update(student_params)
      render json: { student: @student.as_json(only: %i[name age is_external mathilda_class_id]) }, status: :ok, location: @student
    else
      render json: @student.errors, status: :unprocessable_entity
    end
  end

  # DELETE /students/1
  def destroy
    @student.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_student
    @student = Student.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :password, :role)
  end

  def set_mathilda_class
    @mathilda_class = MathildaClass.find(params[:student][:mathilda_class_id])
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :age, :is_external, :mathilda_class_id)
  end
end
