require 'rails_helper'

describe "get a single animal type route", :type => :request do

  before do
  @animal = FactoryBot.create(:animal)
  get "/animals/#{@animal.id}"
  end

  it 'returns a single animal type' do
    expect(JSON.parse(response.body)['animal_type']).to eq(@animal.animal_type)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end