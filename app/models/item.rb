class Item < ApplicationRecord
  validates :image, :item_name, :item_text, presence: true
  validates :price, numericality: { only_integer: true, message: 'is invalid. Input half-width characters' },
                    inclusion: { in: 300..9_999_999, message: 'is out of setting range' }
  validates :category_id, :condition_id, :delivery_type_id, :prefecture_id, :shipping_period_id,
            numericality: { other_than: 1, message: "can't be blank" }

  belongs_to :user
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_type
  belongs_to :prefecture
  belongs_to :shipping_period
end
