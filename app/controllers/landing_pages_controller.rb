class LandingPagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  # Dashboard shows
  before_action :authenticate_user!, only: [:dashboard_show]

  def show
    # Public landing page
    user = User.friendly.find(params[:username])
    @landing_page = user.landing_page

    if @landing_page.nil?
      redirect_to root_path, alert: "Landing page not found."
    else
      @links = @landing_page.links
    end
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "User not found."
  end

  # Optional: dashboard view of landing pages
  def dashboard_show
    @landing_page = current_user.landing_page
  end

end
