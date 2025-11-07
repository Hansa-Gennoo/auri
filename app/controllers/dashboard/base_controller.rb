class Dashboard::BaseController < ApplicationController
  before_action :authenticate_user!, :load_themes
  layout 'dashboard'

  private

  def load_themes
    @themes = Theme.all
  end
end
