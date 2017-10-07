FactoryGirl.define do
  factory :hotel do
    sequence(:name) { |n| "Hotel #{n}" }
    room_count 5
    free_room_count 3
  end
end
