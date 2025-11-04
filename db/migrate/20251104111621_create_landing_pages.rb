class CreateLandingPages < ActiveRecord::Migration[7.1]
  def change
    create_table :landing_pages do |t|
      t.string :title
      t.text :bio
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
