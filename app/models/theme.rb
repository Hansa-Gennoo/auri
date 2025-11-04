class Theme < ApplicationRecord
  has_many :landing_pages

  validates :name, presence: true
  validates :key, presence: true, uniqueness: true
end
