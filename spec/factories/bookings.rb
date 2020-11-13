FactoryBot.define do
  factory :booking do
    sequence(:description) { |n| "Booking #{n}" }
    sequence(:starts_at) { |n| n.days.ago }
    ends_at { starts_at + 1.hour }
    association :space, factory: :space
  end
end
