class Blog < ApplicationRecord
  # associations
  belongs_to :user
  has_and_belongs_to_many :categories

  # validations
  validates :title, presence: true
  validates :content, presence: true
end
