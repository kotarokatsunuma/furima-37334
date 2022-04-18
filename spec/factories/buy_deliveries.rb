FactoryBot.define do
  factory :buy_delivery do
    postcode { '123-4567' }
    prefecture_id { 1 }
    municipality { '東京都' }
    address { '1-1' }
    phonenumber { '09012345678' }
    building_name { '東京ハイツ' }

    
  end
end
