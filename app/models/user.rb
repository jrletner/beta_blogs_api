class User < ApplicationRecord
  # associations
  has_one :profile
  has_many :blogs
  after_create :create_profile
end
