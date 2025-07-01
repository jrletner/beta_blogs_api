class Blog < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :title, presence: true
  validates :content, presence: true
end
