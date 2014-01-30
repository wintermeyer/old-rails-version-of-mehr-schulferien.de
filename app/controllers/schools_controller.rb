class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]

  # GET /schools
  def index
    if params["city_id"]
      @city = City.where(slug: params["city_id"]).first || City.where(id: params["city_id"]).first
      if @city
        @schools = @city.schools.order(:name)
      end
    else
      # @schools = School.all
    end
  end

  # GET /schools/1
  def show
    @months = []
    (0..17).each do |i|
      @months << Day.where(value: (Date.today + i.months)).first.month
    end
    cookies[:last_federal_state] = @city.federal_state.slug
    cookies[:last_school] = @school.slug

    expires_in 1.day, :public => false
    fresh_when etag: [@months, @school]    
  end

  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  def create
    @school = School.new(school_params)

    if @school.save
      redirect_to @school, notice: 'School was successfully created.'
    else
      render action: 'new'
    end
  end

  # PATCH/PUT /schools/1
  def update
    if @school.update(school_params)
      redirect_to @school, notice: 'School was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /schools/1
  def destroy
    @school.destroy
    redirect_to schools_url, notice: 'School was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      if params["city_id"]
        @city = City.where(slug: params["city_id"]).first || City.where(id: params["city_id"]).first
      end

      if @city
        schools = @city.schools
      else
        schools = School.all
      end

      @school = School.where(slug: params["id"]).first || School.where(id: params["id"]).first
    end

    # Only allow a trusted parameter "white list" through.
    def school_params
      params.require(:school).permit(:city_id, :name, :slug, :address_line1, :address_line2, :street, :zip_code, :address_city_name, :phone_number, :fax_number, :email, :homepage)
    end
end
