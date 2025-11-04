class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

   has_one :landing_page, dependent: :destroy

  after_create :create_default_landing_page

  def create_default_landing_page
    default_theme = Theme.first

    create_landing_page(title: "My First Landing Page", theme: Theme.first)
  end

 # extend FriendlyId
  #friendly_id :username, use: :slugged



  #def should_generate_new_friendly_id?
    #slug.blank? || will_save_change_to_username?
  #end

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true
  validates :password, presence: true
end
