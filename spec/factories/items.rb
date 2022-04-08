FactoryBot.define do
  factory :item do
    title            {"タイトル"}
    concept          {"コンセプト"}
    category_id      {"メンズ"}
    status_id        {"新品・未使用"}
    load_id          {"着払い(購入者負担)"}
    prefecture_id    {"北海道"}
    shipping_day_id  {"1~2日で発送"}
  end
end
