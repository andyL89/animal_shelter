require 'rails_helper'

describe "get all details route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @detail = FactoryBot.create(:detail)
    get "/animals/#{@animal.id}/details"
  end

  it 'returns all details' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end
