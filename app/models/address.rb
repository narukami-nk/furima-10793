class Address < ApplicationRecord
  validates :post_code, :prefecture_id, :municipality, :address_number, :telephon_number, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end
