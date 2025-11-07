class LandingPage < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar
  belongs_to :theme, optional: true
  has_many :links, dependent: :destroy
  accepts_nested_attributes_for :links

  after_initialize :set_default_theme, if: :new_record?

  def theme_name
    theme.name
  end

  private

  def set_default_theme
    self.theme ||= Theme.find_by(key: "default") # Pick first preset theme as default
  end
end
