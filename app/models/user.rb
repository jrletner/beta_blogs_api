class User < ApplicationRecord
  # associations
  has_one :profile
  has_many :blogs
  after_create :create_profile

  # validations
  validates :username, :email, :first_name, :last_name, presence: true

  has_secure_password
end
