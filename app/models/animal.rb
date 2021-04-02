class Animal < ApplicationRecord
  has_many :details
  validates :animal_type, :pesence => true
end