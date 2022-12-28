FactoryBot.define do
  factory :posing do
    group { Group.where.not(id: 0).sample }
    category { Category.where.not(id: 0).sample }
    type { Type.where.not(id: 0).sample }
    body_weight { 77.7 }
    remarks { Faker::Lorem.sentence }
    association :user

    after(:build) do |posing|
      posing.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
