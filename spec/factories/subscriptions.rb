require 'faker'

FactoryBot.define do
  factory :subscription do
    user
    stripe_id { Faker::Stripe.valid_card }
    plan { :starter }
    documents_remaining { 5 }
    invites_remaining { 5 }

    trait :premium do
      plan { :premium }
      documents_remaining { 10 }
      invites_remaining { 10 }
    end

    trait :pro do
      plan { :pro }
      documents_remaining { 50 }
      invites_remaining { 20 }
    end
  end
end
