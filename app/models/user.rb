class User < ApplicationRecord
  # associations
  has_one :profile
  has_many :blogs
  after_create :create_profile

  # validations
  validates :first_name, :last_name, :email, :username, presence: true
  has_secure_password
end
