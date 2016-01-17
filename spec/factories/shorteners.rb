FactoryGirl.define do
  factory :shortener do
    url "http://www.google.com/path/to/long/url"
    slug "aabbccdd"

    trait :invalid do
      url 'invalid/long/url'
    end
  end
end
