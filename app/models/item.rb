class Item < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :product_name
    validates :explanatory_text
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :shipment_id
    validates :days_to_ship_id
    validates :price
  end
end
