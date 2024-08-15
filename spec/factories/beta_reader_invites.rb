FactoryBot.define do
  factory :beta_reader_invite do
    association :inviter, factory: :user
    email { Faker::Internet.unique.email }
    status { :active }
    association :document

    trait :with_invitee do
      association :invitee, factory: :user
    end
  end
end
