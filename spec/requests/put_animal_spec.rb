require 'rails_helper'

describe "update an animal type route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    put "/animals/#{@animal.id}", params: { :animal_type => 'updated_animal_type' }
  end

  it 'updates the animal country' do
    expect(Animal.find(@animal.id).country).to eq('updated_country')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This animal has been updated successfully.")
  end
end