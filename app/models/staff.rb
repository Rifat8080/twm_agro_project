class Staff < ApplicationRecord
  belongs_to :user
  belongs_to :organization

  validates :roles, presence: true

  # Ensure roles are unique and valid
  validate :validate_roles

  private

  ALLOWED_ROLES = ["admin", "manager", "editor", "viewer"].freeze

  def validate_roles
    if roles.any? { |role| !ALLOWED_ROLES.include?(role) }
      errors.add(:roles, "contains an invalid role")
    end
  end
end