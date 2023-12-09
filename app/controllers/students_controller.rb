class StudentsController < ApplicationController
  before_action :set_student, only: %i[show update destroy]

  # GET /students
  def index
    @students = Student.all

    render json: @students
  end

  # GET /students/1
  def show
    render json: @student
  end

  # POST /students
  def create
    user = User.new(user_params)
    if user.save
      student = Student.new(student_params)
      mathilda_class = MathildaClass.find(params[:student][:mathilda_class_id])
      student.mathilda_class = mathilda_class
      student.user = user

      if student.save
        render json: student, status: :created, location: student
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
    mathilda_class = MathildaClass.find(params[:student][:mathilda_class_id])
    @student.mathilda_class = mathilda_class
    if @student.update(student_params)
      render json: @student
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
    params.require(:user).permit(:email, :password_digest, :role)
  end

  # Only allow a list of trusted parameters through.
  def student_params
    params.require(:student).permit(:name, :age, :is_external, :mathilda_class_id)
  end
end
