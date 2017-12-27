class Category < ApplicationRecord
  has_many :restaurants, dependent: :restrict_with_error
  # has_many :restaurants, dependent: :restrict_with_exception
  validates_presence_of :name
end
