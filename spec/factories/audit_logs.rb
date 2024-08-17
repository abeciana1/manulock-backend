FactoryBot.define do
  factory :audit_log do
    association :user
    association :document
    action { :viewed_document }
    created_at { Faker::Time.backward(days: 1, period: :afternoon) }

    trait :with_invite do
      association :beta_reader_invite
      action { :accepted_invite }
    end
  end
end
