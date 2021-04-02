require 'rails_helper'

describe "delete an animal's details route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @detail1 = FactoryBot.create(:detail)
    @detail2 = FactoryBot.create(:detail)
  end

  it "deletes an animal's details" do
    delete "/animals/#{@animal.id}/details/#{@detail1.id}"
    expect(JSON.parse(response.body)['message']).to eq("This animal's details have been deleted successfully.")
  end

  it "deletes an animal's details" do
    delete "/animals/#{@animal.id}/details/#{@detail1.id}"
    get "/animals/#{@animal.id}/details"
    expect(JSON.parse(response.body).size).to eq(1)
  end
end