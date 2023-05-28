# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile

  enum role: { user: 0, admin: 1, accounting: 2, sales: 3, developer: 4 }

  validates :name, presence: true

  after_create :create_profile

  private

  def create_profile
    build_profile.save
  end
end

# app/models/profile.rb
class Profile < ApplicationRecord
  belongs_to :user

  enum role: { user: 0, admin: 1, accounting: 2, sales: 3, developer: 4 }
end
