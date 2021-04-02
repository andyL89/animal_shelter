require 'rails_helper'

describe Detail do
  it { should belong_to(:animal) }
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:breed)}
  it { should validate_presence_of(:sex)}
  it { should validate_presence_of(:color)}
  it { should validate_presence_of(:age)}
  it { should validate_presence_of(:weight)}
  it { should validate_presence_of(:bio)}
end