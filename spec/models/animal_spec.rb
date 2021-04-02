require 'rails_helper'

describe Animal do
  it { should have_many(:details) }
  it { should validate_presence_of(:animal_type)}
end