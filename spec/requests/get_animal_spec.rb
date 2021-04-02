require 'rails_helper'

describe "get a single animal type route", :type => :request do

  before do
  @animal = FactoryBot.create(:animal)
  get "/animals/#{@animal.id}"
  end

  it 'returns a single animal type' do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end