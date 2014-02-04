class FederalStatesController < ApplicationController
  before_action :set_federal_state, only: [:show, :edit, :update, :destroy]

  # GET /federal_states
  # GET /federal_states.json
  def index
    @federal_states = FederalState.all

    expires_in 1.hour, :public => false
    fresh_when etag: [current_user, @federal_states]
  end

  # GET /federal_states/1
  # GET /federal_states/1.json
  def show
    @months = []
    (0..17).each do |i|
      @months << Day.where(value: (Date.today + i.months)).first.month
    end
    cookies[:last_federal_state] = @federal_state.slug

    expires_in 1.hour, :public => false
    fresh_when etag: [current_user, @months, @federal_state]
  end

  # GET /federal_states/new
  def new
    @federal_state = FederalState.new
  end

  # GET /federal_states/1/edit
  def edit
  end

  # POST /federal_states
  # POST /federal_states.json
  def create
    @federal_state = FederalState.new(federal_state_params)

    respond_to do |format|
      if @federal_state.save
        format.html { redirect_to @federal_state, notice: 'Federal state was successfully created.' }
        format.json { render action: 'show', status: :created, location: @federal_state }
      else
        format.html { render action: 'new' }
        format.json { render json: @federal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /federal_states/1
  # PATCH/PUT /federal_states/1.json
  def update
    respond_to do |format|
      if @federal_state.update(federal_state_params)
        format.html { redirect_to @federal_state, notice: 'Federal state was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @federal_state.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /federal_states/1
  # DELETE /federal_states/1.json
  def destroy
    @federal_state.destroy
    respond_to do |format|
      format.html { redirect_to federal_states_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_federal_state
      if FederalState.where(slug: params[:id]).any?
        @federal_state = FederalState.where(slug: params[:id]).first
      else
        @federal_state = FederalState.where(id: params[:id]).first
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def federal_state_params
      params.require(:federal_state).permit(:country_id, :name, :slug)
    end
end
