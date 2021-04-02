# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
class Seed

  def self.begin
    seed = Seed.new
    seed.generate_animals
  end

  def generate_animals
    animal_1 = Animal.create!(
      animal_type: "cat"
    )
    animal_2 = Animal.create!(
      animal_type: "dog"
    )
    10.times do |i|
      Detail.create!(name: Faker::Creature::Cat.name, breed: Faker::Creature::Cat.breed, sex: Faker::Gender.binary_type, color: Faker::Color.color_name, age: Faker::Number.within(range: 1..20), weight: Faker::Number.within(range: 1..20), bio: Faker::TvShows::TwinPeaks.quote, animal_id: animal_1.id)
    end
    10.times do |i|
      Detail.create!(name: Faker::Creature::Dog.name, breed: Faker::Creature::Dog.breed, sex: Faker::Gender.binary_type, color: Faker::Color.color_name, age: Faker::Number.within(range: 1..20), weight: Faker::Number.within(range: 1..100), bio: Faker::TvShows::TwinPeaks.quote, animal_id: animal_2.id)
    end
  end
end

Seed.begin