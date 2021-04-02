require 'rails_helper'

describe "delete an animal's details route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @detail1 = Detail.create({ :name => 'Lula', :breed => 'Welsh Corgi', :sex => 'Female', :color => 'Brown, Black, & White', :age => 3, :weight => 25, :bio => 'A sometimes loud, yet very cute pup.', :animal_id => @animal.id })
    @detail2 = Detail.create({ :name => 'Bob', :breed => 'Tabby', :sex => 'Male', :color => 'Tuxedo', :age => 8, :weight => 11, :bio => 'A sleepy cat.', :animal_id => @animal.id })
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