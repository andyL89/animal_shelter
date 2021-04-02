class Animal < ApplicationRecord
  has_many :details
  validates :animal_type, :presence => true
end