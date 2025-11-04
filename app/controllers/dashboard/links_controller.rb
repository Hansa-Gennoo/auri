class Dashboard::LinksController < Dashboard::BaseController
  before_action :set_landing_page

  def index
    @links = Link.all
  end



  def new
    @landing_page = current_user.landing_page


    @link = @landing_page.links.new
  end

  def create
    @link = @landing_page.links.new(link_params)
    if @link.save
      redirect_to dashboard_landing_page_path(@landing_page), notice: "Link created!"
    else
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
  end

  def update
    @landing_page = current_user.landing_page
    @link = @landing_page.links.find(params[:id])
    if @link.update(link_params)
      redirect_to dashboard_landing_page_links_path(@landing_page), notice: "Link updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @landing_page = current_user.landing_page(params[:landing_page_id])
    @link = @landing_page.links.find(params[:id])
    @link.destroy
    redirect_to dashboard_landing_page_links_path(@landing_page), notice: "Link deleted."
  end


  def reorder
    params[:ids].each_with_index do |id, index|
      @landing_page.links.find(id).update(position: index + 1)
    end
    head :ok
  end

  private

  def set_landing_page
    @landing_page = current_user.landing_page
  end

  def link_params
    params.require(:link).permit(:title, :url, :position)
  end
end
