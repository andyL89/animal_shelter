class Detail < ApplicationRecord
  belongs_to :animal
  validates :name, :presence => true
  validates :breed, :presence => true
  validates :sex, :presence => true
  validates :color, :presence => true
  validates :age, :presence => true
  validates :weight, :presence => true
  validates :bio, :presence => true
end