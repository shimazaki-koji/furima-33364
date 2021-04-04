class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_condition
  belongs_to_active_hash :days_to_ship
  belongs_to_active_hash :shipment
  belongs_to_active_hash :delivery_fee

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
