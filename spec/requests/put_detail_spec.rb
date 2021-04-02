require 'rails_helper'

describe "update an animal's details route", :type => :request do

  before do
    @animal = FactoryBot.create(:animal)
    @detail = Detail.create({ :author => 'Jo', :content => 'wow, what a lovely place', :rating => 5, :animal_id => @animal.id })
    put "/animals/#{@animal.id}/details/#{@detail.id}", params: { :name => 'Lula', :breed => 'Welsh Corgi', :sex => 'Female', :color => 'Brown, Black, & White', :age => 3, :weight => 25, :bio => 'A sometimes loud, yet very cute pup.' }
  end

  it "updates the name in an animal's details" do
    expect(Detail.find(@detail.id).name).to eq('Lula')
  end

  it "updates the breed in an animal's details" do
    expect(Detail.find(@detail.id).breed).to eq('Welsh Corgi')
  end

  it "updates the sex in an animal's details" do
    expect(Detail.find(@detail.id).sex).to eq('Female')
  end

  it "updates the color in an animal's details" do
    expect(Detail.find(@detail.id).sex).to eq('Brown, Black, & White')
  end

  it "updates the age in an animal's details" do
    expect(Detail.find(@detail.id).sex).to eq(3)
  end

  it "updates the weight in an animal's details" do
    expect(Detail.find(@detail.id).sex).to eq(25)
  end

  it "updates the bio in an animal's details" do
    expect(Detail.find(@detail.id).sex).to eq('A sometimes loud, yet very cute pup.')
  end

  it 'returns an updated status' do
    expect(JSON.parse(response.body)['message']).to eq("This animal's details have been updated successfully.")
  end
end