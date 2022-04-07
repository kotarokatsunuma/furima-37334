class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :prefecture
  belongs_to :shipping_day
  belongs_to :user
  has_one_attached :image

  validates :title, :text, presence: true
  validates :concept, :text, presence: true


  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :load_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_day_id, numericality: { other_than: 1 , message: "can't be blank" } 
end
