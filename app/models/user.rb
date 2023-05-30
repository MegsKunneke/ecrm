class User < ApplicationRecord
enum role: { admin: 0, accounts: 1, sales: 2, developer: 3 }

    attribute :name, :string
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

validates :name, presence: true


  after_create :create_profile

  private

  def create_profile
    build_profile.save
  end
end
