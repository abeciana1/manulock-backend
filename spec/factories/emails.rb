FactoryBot.define do
  factory :email do
    association :user
    subject { Faker::Lorem.sentence }
    body { Faker::Lorem.paragraph }
    sent_at { Faker::Time.backward(days: 2, period: :evening) }

    trait :with_events do
      after(:create) do |email|
        create_list(:email_event, 3, email: email)
      end
    end
  end
end
