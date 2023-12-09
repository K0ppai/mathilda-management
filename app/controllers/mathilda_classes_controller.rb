class MathildaClassesController < ApplicationController
  before_action :set_mathilda_class, only: %i[show update destroy]

  # GET /mathilda_classes
  def index
    @mathilda_classes = MathildaClass.all

    render json: @mathilda_classes
  end

  # GET /mathilda_classes/1
  def show
    render json: @mathilda_class
  end

  # POST /mathilda_classes
  def create
    @mathilda_class = MathildaClass.new(mathilda_class_params)

    if @mathilda_class.save
      render json: @mathilda_class, status: :created, location: @mathilda_class
    else
      render json: @mathilda_class.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /mathilda_classes/1
  def update
    if @mathilda_class.update(mathilda_class_params)
      render json: @mathilda_class
    else
      render json: @mathilda_class.errors, status: :unprocessable_entity
    end
  end

  # DELETE /mathilda_classes/1
  def destroy
    @mathilda_class.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_mathilda_class
    @mathilda_class = MathildaClass.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def mathilda_class_params
    params.require(:mathilda_class).permit(:name)
  end
end
