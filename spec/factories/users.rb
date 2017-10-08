FactoryGirl.define do
  factory :user do
    sequence(:firstname) { |n| "Firstname #{n}" }
    sequence(:lastname) { |n| "Lastname #{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password '123456'

    factory :admin do
      admin true
    end
  end
end
