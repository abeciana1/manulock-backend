FactoryBot.define do
  factory :nda do
    association :user
    association :document
    signed_at { Faker::Time.backward(days: 14, period: :evening) }
    pdf_url { "https://example.com/nda-#{Faker::Number.number(digits: 5)}.pdf" }

    trait :signed do
      signed { 1 }
      signed_at { Faker::Time.backward(days: 7, period: :morning) }
    end

    trait :unsigned do
      signed { 0 }
      signed_at { nil }
    end
  end
end
