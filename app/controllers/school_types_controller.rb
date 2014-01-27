class SchoolTypesController < ApplicationController
  before_action :set_school_type, only: [:show, :edit, :update, :destroy]

  # GET /school_types
  def index
    @school_types = SchoolType.all
  end

  # GET /school_types/1
  def show
  end

  # GET /school_types/new
  def new
    @school_type = SchoolType.new
  end

  # GET /school_types/1/edit
  def edit
  end

  # POST /school_types
  def create
    @school_type = SchoolType.new(school_type_params)

    if @school_type.save
      redirect_to @school_type, notice: 'School type was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /school_types/1
  def update
    if @school_type.update(school_type_params)
      redirect_to @school_type, notice: 'School type was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /school_types/1
  def destroy
    @school_type.destroy
    redirect_to school_types_url, notice: 'School type was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school_type
      @school_type = SchoolType.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def school_type_params
      params.require(:school_type).permit(:name)
    end
end
