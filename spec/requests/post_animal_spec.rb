require 'rails_helper'

describe "post an animal type route", :type => :request do

  before do
    post '/animals', params: { :animal_type => 'marsupial' }
  end

  it 'returns the animal type' do
    expect(JSON.parse(response.body)['animal_type']).to eq('marsupial')
  end

  it 'returns a created status' do
    expect(response).to have_http_status(:created)
  end
end