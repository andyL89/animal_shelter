require 'rails_helper'

describe "delete an animal type route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @animal2 = FactoryBot.create(:animal)
  end

  it 'deletes animal' do
    delete "/animals/#{@animal.id}"
    expect(JSON.parse(response.body)['message']).to eq("This animal type has been deleted successfully.")
  end

  it 'deletes a animal' do
    delete "/animals/#{@animal.id}"
    get "/animals"
    expect(JSON.parse(response.body)).to eq([YAML.load(@animal2.to_json)])
  end
end