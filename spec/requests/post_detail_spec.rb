require 'rails_helper'

describe "post a detail route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    post "/animals/#{@animal.id}/details", params: { :name => 'Lula', :breed => 'Welsh Corgi', :sex => 'Female', :color => 'Brown, Black, & White', :age => 3, :weight => 25, :bio => 'A sometimes loud, yet very cute pup.' }
  end

  it 'returns author of detail' do
    expect(JSON.parse(response.body)['name']).to eq('Lula')
  end

  it 'returns content of detail' do
    expect(JSON.parse(response.body)['breed']).to eq('Welsh Corgi')
  end

  it 'returns rating of detail' do
    expect(JSON.parse(response.body)['sex']).to eq('Female')
  end

  it 'returns rating of detail' do
    expect(JSON.parse(response.body)['color']).to eq('Brown, Black, & White')
  end

  it 'returns rating of detail' do
    expect(JSON.parse(response.body)['age']).to eq(3)
  end

  it 'returns rating of detail' do
    expect(JSON.parse(response.body)['weight']).to eq(25)
  end

  it 'returns rating of detail' do
    expect(JSON.parse(response.body)['bio']).to eq('A sometimes loud, yet very cute pup.')
  end
end