FactoryBot.define do
  factory(:animal) do
    animal_type {Faker::Creature::Animal.name}
  end
  factory(:detail) do
    name {Faker::Creature::Cat.name}
    breed {Faker::Creature::Cat.breed}
    sex {Faker::Gender.binary_type}
    color {Faker::Color.color_name}
    age {Faker::Number.within(range: 1..20)}
    weight {Faker::Number.within(range: 1..20)}
    bio {Faker::TvShows::TwinPeaks.quote}
  end
end