class ThemesController < ApplicationController
  before_action :authenticate_admin!


  def index
      @themes = Theme.all
  end

  def show
   @theme = Theme.find_by(key: params[:id]) || Theme.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @theme }
    end
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(theme_params)
    if @theme.save
      redirect_to themes_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:id])
    @theme.update(theme_params)

    redirect_to themes_path
  end

  def destroy
    @theme = Them.find(params[:id])
    @theme.destroy

    redirect_to themes_path, status: :see_other
  end

  private

  def theme_params
    params.require(:theme).permit(:name, :key, :base, :primary_colour, :accent_colour, :background_colour, :font_heading, :font_body, :customisable)

  end

  def authenticate_admin!
    redirect_to root_path, alert: "Access denied." unless current_user.admin?
  end
end
