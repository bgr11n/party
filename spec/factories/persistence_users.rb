FactoryGirl.define do
  factory :user, :class => 'Persistence::User' do
    nickname { Faker::Lorem.word }
    email { Faker::Internet.email }
    source 'auth'
    grand false
    password_salt 'password_salt'
    password_hash 'password_hash'
  end
end
