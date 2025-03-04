class Organization < ApplicationRecord
  belongs_to :user
  has_many :staffs, dependent: :destroy
  validates :organization_name, presence: true
end
