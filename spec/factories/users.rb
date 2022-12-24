FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    body_height { 175.3 }
    body_weight { 85.1 }
    self_introduction { Faker::Lorem.sentence }
  end
end
