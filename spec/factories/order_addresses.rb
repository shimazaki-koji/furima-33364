FactoryBot.define do
  factory :order_address do
    postal_code { "999-9999" }
    shipment_id { 2 }
    city { 'hoge市' }
    address { 'fuga1-1-1' }
    building { 'hogefuga' }
    phone_number { "09000000000" }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
