require 'rails_helper'

describe "get all animal types route", :type => :request do
  let!(:animals) { FactoryBot.create_list(:animal, 3)}

  before { get '/animals'}

  it 'returns all animal types' do
    expect(JSON.parse(response.body).size).to eq(3)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end