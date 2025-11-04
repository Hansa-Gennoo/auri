class Link < ApplicationRecord
  belongs_to :landing_page

  validates :title, :url, presence: true
end
