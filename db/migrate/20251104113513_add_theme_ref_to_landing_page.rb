class AddThemeRefToLandingPage < ActiveRecord::Migration[7.1]
  def change
    add_reference :landing_pages, :theme, null: false, foreign_key: true
  end
end
