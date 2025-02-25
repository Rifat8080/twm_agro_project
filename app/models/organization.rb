class Organization < ApplicationRecord
  belongs_to :user
  validates :organization_name, presence: true
end
