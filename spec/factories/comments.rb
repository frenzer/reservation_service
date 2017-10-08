FactoryGirl.define do
  factory :comment do
    body "Lorem ipsum dolor sit amet, consectetur adipisicing elit."

    association :room, factory: :room
    association :user, factory: :user
  end
end
