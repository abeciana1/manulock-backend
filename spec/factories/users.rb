require 'faker'

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.unique.email }
    auth_id { Faker::Number.number(digits: 6) }
    
    trait :with_inviter do
      association :invited_by, factory: :user
    end

    trait :reviewer do
      role { 1 }
    end

    trait :inviter do
      role { 0 }
    end
  end
end
