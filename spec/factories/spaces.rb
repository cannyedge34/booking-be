FactoryBot.define do
  factory :space do
    title { Faker::Lorem.word }
    rooms_number { Faker::Number.number(3) }
  end
end
