FactoryGirl.define do
  factory :room do
    sequence(:room_number) { |n| n }
    reserved false
    association :hotel, factory: :hotel

    factory :reserved_room do
      reserved true
      association :user, factory: :user
    end
  end
end
