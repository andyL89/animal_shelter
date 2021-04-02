require 'rails_helper'

describe "update an animal type route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    put "/animals/#{@animal.id}", params: { :animal_type => 'updated_animal_type' }
  end

  it 'updates the animal type' do
    expect(Animal.find(@animal.id).country).to eq('updated_animal_type')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This animal type has been updated successfully.")
  end
end