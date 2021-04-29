class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :shipment

  with_options presence: true do
    validates :postal_code, format: {with:/\A\d{3}[-]\d{4}\z/}
    validates :shipment_id
    validates :municipalities
    validates :addres
    validates :phone_nunber
  end
  validates :building
end
