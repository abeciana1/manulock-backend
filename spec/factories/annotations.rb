FactoryBot.define do
  factory :annotation do
    association :document
    page_number { Faker::Number.between(from: 1, to: 50) }
    selected_text { Faker::Lorem.sentence(word_count: 5) }
    association :user
    
    bounding_x1 { Faker::Number.decimal(l_digits: 3, r_digits: 6) }
    bounding_y1 { Faker::Number.decimal(l_digits: 3, r_digits: 6) }
    bounding_x2 { bounding_x1 + Faker::Number.decimal(l_digits: 1, r_digits: 6) }
    bounding_y2 { bounding_y1 + Faker::Number.decimal(l_digits: 1, r_digits: 6) }
    bounding_width { bounding_x2 - bounding_x1 }
    bounding_height { bounding_y2 - bounding_y1 }

    rects do
      [
        {
          x1: bounding_x1,
          y1: bounding_y1,
          x2: bounding_x2,
          y2: bounding_y2,
          width: bounding_width,
          height: bounding_height
        }
      ]
    end

    trait :highlight do
      annotation_type { 0 }
    end

    trait :comment do
      annotation_type { 1 }
    end

  end
end
