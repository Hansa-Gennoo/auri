class Dashboard::LandingPagesController < Dashboard::BaseController
  before_action :set_landing_page, only: [:show, :edit, :update]



  def show
    @landing_page = LandingPage.find(params[:id])
    @links = @landing_page.links.order(:position)
    @themes = Theme.all
  end


  def edit
    @landing_page = current_user.landing_page
    render partial: "form", locals: { landing_page: @landing_page } if turbo_frame_request?
  end


  def update
    @landing_page = current_user.landing_page

   # Attach avatar manually if present
    if params[:landing_page][:avatar].present?
      @landing_page.avatar.attach(params[:landing_page][:avatar])
    end

    respond_to do |format|
      if @landing_page.update(landing_page_params.except(:avatar))
        format.html { redirect_to dashboard_landing_page_path(@landing_page), notice: "Landing page updated." }
        format.json { render json: { success: true, theme_id: @landing_page.theme_id }, status: :ok }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: { success: false, errors: @landing_page.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  private

  # Ensures the current user always has a landing page with a valid theme
  def set_landing_page
    @landing_page = current_user.landing_page || current_user.create_landing_page!(theme: Theme.find_by(key: "default"))

    return if @landing_page.present?


    default_theme = Theme.find_by!(key: "default")


    @landing_page = current_user.create_landing_page!(
      title: "My Landing Page",
      theme: default_theme
    )
  end

  def landing_page_params
    params.require(:landing_page).permit(:title, :bio, :theme_id, :avatar, links_attributes: [:id, :title, :url, :_destroy])
  end

end
