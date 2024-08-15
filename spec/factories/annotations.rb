FactoryBot.define do
  factory :annotation do
    page_number { Faker::Number.between(from: 1, to: 50) }
    selected_text { Faker::Lorem.sentence(word_count: 5) }
    coordinates { "100,200,150,250" } # Example coordinates
    association :document
  end
end
