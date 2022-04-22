class BuyDelivery
  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :municipality, :address, :phonenumber, :building_name, :item_id, :user_id, :buy_id,
                :token

  extend ActiveHash::Associations::ActiveRecordExtensions

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :address
    validates :token
    validates :phonenumber, format: { with: /\A\d{10,11}\z/, message: 'is invalid' }
    validates :postcode, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :user_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :item_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    buy = Buy.create(user_id: user_id, item_id: item_id)
    Delivery.create(postcode: postcode, prefecture_id: prefecture_id, municipality: municipality, address: address,
                    phonenumber: phonenumber, building_name: building_name, buy_id: buy.id)
  end
end
