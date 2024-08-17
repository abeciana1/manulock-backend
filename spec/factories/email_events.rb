FactoryBot.define do
  factory :email_event do
    association :email
    geolocation { "#{Faker::Address.latitude}, #{Faker::Address.longitude}" }
    additional_data { { ip_address: Faker::Internet.ip_v4_address } }

    # email clients
    trait :gmail do
      email_client { :gmail }
    end

    trait :outlook do
      email_client { :outlook }
    end

    trait :yahoo do
      email_client { :yahoo }
    end

    # event types
    trait :sent do
      event_type { :sent }
    end

    trait :opened do
      event_type { :opened }
    end

    trait :clicked do
      event_type { :clicked }
    end

    trait :bounced do
      event_type { :bounced }
    end

    # device types
    trait :desktop do
      device_type { :desktop }
    end

    trait :mobile do
      device_type { :mobile }
    end

    trait :tablet do
      device_type { :tablet }
    end
  end
end
