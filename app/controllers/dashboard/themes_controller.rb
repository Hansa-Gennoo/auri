class Dashboard::ThemesController < ApplicationController
  before_action :set_landing_page

    def index
      @themes = Theme.all
    end

    def edit
      @theme = Theme.find(params[:id])
    end

    def update
      @landing_page.theme = Theme.find(params[:id])
      if @landing_page.save
        redirect_to dashboard_landing_page_path(@landing_page), notice: "Theme applied successfully!"
      else
        redirect_to dashboard_landing_page_themes_path(@landing_page), alert: "Something went wrong."
      end
    end

    private

    def set_landing_page
      @landing_page = current_user.landing_page
    end
end
