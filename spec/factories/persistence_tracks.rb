FactoryGirl.define do
  factory :track, :class => 'Persistence::Track' do
    uri { Faker::Lorem.characters(10) }
    title { Faker::Lorem.sentence(3) }
    thumbnail { Faker::Avatar.image }
    duration { Faker::Number.number(3) }
  end
end
