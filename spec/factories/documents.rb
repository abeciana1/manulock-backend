FactoryBot.define do
  factory :document do
    title { Faker::Book.title }
    file_path { "path/to/fakefile-#{Faker::Number.number(digits: 5)}.pdf" }
    association :owner, factory: :user
  end
end
