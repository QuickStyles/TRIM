FactoryGirl.define do
  factory :service do
    name "MyString"
    rate 1.5
    certified false
    location "MyString"
    duration 1
    user nil
  end
end
