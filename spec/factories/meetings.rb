FactoryGirl.define do
  factory :meeting do
    title "MyString"
    description "MyString"
    author "MyString"
    date Faker::Date.forward(2)
  end

  factory :invalid_meeting, parent: :meeting do
    title nil
    date nil
  end
end
