salt = BCrypt::Engine.generate_salt

FactoryGirl.define do
  factory :identity_auth, :class => 'Persistence::UserIdentity' do
    user
    email { Faker::Internet.email }
    source 'plain'
    data ''
    password_salt salt
    password_hash BCrypt::Engine.hash_secret('correct_password', salt)
  end

  factory :identity_twitch, :class => 'Persistence::UserIdentity' do
    user
    email { Faker::Internet.email }
    source 'twitch'
    data 'data info from twitch'
  end
end
