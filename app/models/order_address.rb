class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :shipment_id, :city, :address, :building, :phone_number, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :shipment_id
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A[0-9]+\z/ }, length: { maximum: 11 }
    validates :user_id
    validates :item_id
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, shipment_id: shipment_id, city: city, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end