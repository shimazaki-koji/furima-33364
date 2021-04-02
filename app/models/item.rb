class Item < ApplicationRecord
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :item_status
  belongs_to_active_hash :item_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :scheduled_delivery

  with_options presence: true do
    validates :product_name
    validates :explanatory_text
    validates :category_id
    validates :product_condition_id
    validates :delivery_fee_id
    validates :shipment_id
    validates :days_to_ship_id
    validates :price
    validates :title, :text
    validates :genre_id,numericality: { other_than: 1 }
  end
end
