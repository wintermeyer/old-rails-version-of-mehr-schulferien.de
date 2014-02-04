class AuthenticationsController < ApplicationController
  # before_action :set_authentication, only: [:show, :edit, :update, :destroy]

  # GET /authentications
  def index
    @authentications = Authentication.all
  end

  # GET /authentications/1
  def show
  end

  # GET /authentications/new
  def new
    @authentication = Authentication.new
  end

  # GET /authentications/1/edit
  def edit
  end

  # POST /authentications
  def create
    # Facebook only
    #
    auth = request.env["omniauth.auth"]
    authentication = Authentication.where(provider: auth.provider, uid: auth.uid).first

    if Authentication.where(provider: auth.provider, uid: auth.uid).any?
      @user = Authentication.where(provider: auth.provider, uid: auth.uid).first.user
    else
      # logger.info auth.extra.to_yaml
      @user = User.create( first_name:auth.extra.raw_info.first_name,
                           last_name:auth.extra.raw_info.last_name,
                           email: auth.info.email,
                           password:Devise.friendly_token[0,20],
                         )
      @user.authentications.where(provider: auth.provider, uid: auth.uid).first_or_create
    end

    sign_in @user

    redirect_to page_status_path, notice: "Sie sind mit der E-Mail Adresse #{current_user.email} eingeloggt. Jetzt können Sie Daten hinzufügen und verändern."
  end

  # PATCH/PUT /authentications/1
  def update
    if @authentication.update(authentication_params)
      redirect_to @authentication, notice: 'Authentication was successfully updated.'
    else
      render action: 'edit'
    end
  end

  # DELETE /authentications/1
  def destroy
    # @authentication.destroy
    # redirect_to authentications_url, notice: 'Authentication was successfully destroyed.'
    sign_out current_user
    redirect_to page_login_path, notice: 'Sie sind jetzt ausgeloggt. Vielen Dank für Ihre Hilfe!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_authentication
      @authentication = Authentication.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def authentication_params
      params.require(:authentication).permit(:user_id, :provider, :uid)
    end
end
