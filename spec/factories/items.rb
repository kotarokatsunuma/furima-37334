FactoryBot.define do
  factory :item do
    title            {"タイトル"}
    concept          {"コンセプト"}
    category_id      {"2"}
    status_id        {"2"}
    load_id          {"2"}
    prefecture_id    {"1"}
    shipping_day_id  {"2"}
    price            {300}
    association :user 

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
