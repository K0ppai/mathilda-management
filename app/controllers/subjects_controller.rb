class SubjectsController < ApplicationController
  before_action :set_subject, only: %i[show update destroy]
  before_action :set_mathilda_class, only: %i[create]
  skip_before_action :authorized, only: %i[index]

  # GET /subjects
  def index
    @subjects = Subject.all.includes(:mathilda_class)

    render json: @subjects.as_json(
      include: {
        mathilda_class: {
          only: %i[id name]
        }
      },
      only: %i[id name mathilda_class_id]
    )
  end

  # GET /subjects/1
  def show
    render json: @subject
  end

  # POST /subjects
  def create
    @subject = Subject.new(subject_params)
    @subject.mathilda_class = @mathilda_class

    if @subject.save
      render json: @subject, status: :created, location: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /subjects/1
  def update
    @subject.mathilda_class = @mathilda_class
    if @subject.update(subject_params)
      render json: @subject
    else
      render json: @subject.errors, status: :unprocessable_entity
    end
  end

  # DELETE /subjects/1
  def destroy
    @subject.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_subject
    @subject = Subject.find(params[:id])
  end

  def set_mathilda_class
    @mathilda_class = MathildaClass.find(params[:subject][:mathilda_class_id])
  end

  # Only allow a list of trusted parameters through.
  def subject_params
    params.require(:subject).permit(:name, :mathilda_class_id)
  end
end
