class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipality,:address_number, :building, :telephone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :user_id, :token
    validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipality, :address_number
    validates :telephone_number,length: {minimum: 10, maximum: 11},format: { with: /\A\d{10,11}\z/, message: 'is invalid. Input half-width characters' }
  end  

  def save
  order = Order.create(user_id: user_id, item_id: item_id)
  Address.create(post_code: post_code, prefecture_id: prefecture_id, municipality: municipality,address_number: address_number, building: building, telephone_number: telephone_number, order_id: order.id)

  end


end