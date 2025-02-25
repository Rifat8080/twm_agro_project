class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  has_one :individual, dependent: :destroy
  has_one :organization, dependent: :destroy
  
  validates :role, presence: true, inclusion: { in: %w[individual organization] }

  def individual?
      role == "individual"
  end
  def organization?
      role == "organization"
  end
end
