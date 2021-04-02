require 'rails_helper'

describe "get a single animal's details route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @detail = Detail.create({ :name => 'Lula', :breed => 'Welsh Corgi', :sex => 'Female', :color => 'Brown, Black, & White', :age => 3, :weight => 25, :bio => 'A sometimes loud, yet very cute pup.', :animal_id => @animal.id })
    get "/animals/#{@animal.id}/details/#{@id}"
  end

  it "returns a single animal's details" do
    expect(JSON.parse(response.body).size).to eq(1)
  end

  it 'returns status code 200' do
    expect(response).to have_http_status(:success)
  end
end