# app/controllers/themes_controller.rb
class ThemesController < ApplicationController
  before_action :authenticate_admin!, :set_theme, only: [:edit, :update, :destroy]

  # GET /themes
  def index
    @themes = Theme.all
  end

  # GET /themes/new
  def new
    @theme = Theme.new
  end

  # POST /themes
  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to themes_path, notice: "Theme created successfully."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # GET /themes/:id/edit
  def edit
  end

  # PATCH/PUT /themes/:id
  def update
    if @theme.update(theme_params)
      redirect_to themes_path, notice: "Theme updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /themes/:id
  def destroy
    default_theme = Theme.find_by(key: "default")

    if @theme == default_theme
      redirect_to themes_path, alert: "You cannot delete the default theme."
      return
    end

    # Reassign landing pages to the default theme
    @theme.landing_pages.update_all(theme_id: default_theme.id)

    # Destroy the theme
    @theme.destroy

    respond_to do |format|
      format.html do
        redirect_to themes_path, notice: "Theme deleted. Affected landing pages were reset to the default theme."
      end
      format.turbo_stream do
        render turbo_stream: turbo_stream.remove(@theme)
      end
    end
  end

  private

  def set_theme
    @theme = Theme.find(params[:id])
  end

  def theme_params
    params.require(:theme).permit(
      :name,
      :key,
      :base,
      :primary_colour,
      :accent_colour,
      :background_colour,
      :font_heading,
      :font_body,
      :customisable
    )
  end



  def authenticate_admin!
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
