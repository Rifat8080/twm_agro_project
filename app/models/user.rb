class User < ApplicationRecord
  has_one :individual
  has_one :organization
  has_many :staffs, through: :organization

  # Devise modules
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Role-based methods
  def individual?
    role == 'individual'
  end

  def organization?
    role == 'organization'
  end
end