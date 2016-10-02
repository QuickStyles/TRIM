FactoryGirl.define do
  factory :review do
    booking nil
    user nil
    rating 1
    body "MyText"
  end
end
