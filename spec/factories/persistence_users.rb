FactoryGirl.define do
  factory :user, :class => 'Persistence::User' do
    nickname { Faker::Lorem.word }
    grand false
  end
end
