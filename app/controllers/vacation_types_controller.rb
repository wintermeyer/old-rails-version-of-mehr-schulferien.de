class VacationTypesController < ApplicationController
  before_action :set_vacation_type, only: [:show, :edit, :update, :destroy]

  # GET /vacation_types
  # GET /vacation_types.json
  def index
    @vacation_types = VacationType.all
  end

  # GET /vacation_types/1
  # GET /vacation_types/1.json
  def show
  end

  # GET /vacation_types/new
  def new
    @vacation_type = VacationType.new
  end

  # GET /vacation_types/1/edit
  def edit
  end

  # POST /vacation_types
  # POST /vacation_types.json
  def create
    @vacation_type = VacationType.new(vacation_type_params)

    respond_to do |format|
      if @vacation_type.save
        format.html { redirect_to @vacation_type, notice: 'Vacation type was successfully created.' }
        format.json { render action: 'show', status: :created, location: @vacation_type }
      else
        format.html { render action: 'new' }
        format.json { render json: @vacation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vacation_types/1
  # PATCH/PUT /vacation_types/1.json
  def update
    respond_to do |format|
      if @vacation_type.update(vacation_type_params)
        format.html { redirect_to @vacation_type, notice: 'Vacation type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vacation_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vacation_types/1
  # DELETE /vacation_types/1.json
  def destroy
    @vacation_type.destroy
    respond_to do |format|
      format.html { redirect_to vacation_types_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vacation_type
      @vacation_type = VacationType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vacation_type_params
      params.require(:vacation_type).permit(:name, :slug)
    end
end
