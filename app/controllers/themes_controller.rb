class ThemesController < ApplicationController
  def show
    @theme = Theme.find(params[:id])
  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new
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
    require.params(:theme).permit(:name, :key, :base, :primary_colour, :accent_colour, :background_colour, :font_heading, :font_body, :customisable)

  end
end
