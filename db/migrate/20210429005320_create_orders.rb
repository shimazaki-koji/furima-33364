class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal_code, null: false, default: ""
      t.integer :shipment_id, null: false
      t.string :municipalities, null: false, defalut: ""
      t.string :addres, null: false, defalut: ""
      t.string :building, null: false, defalut: ""
      t.string :phone_number, null: false, defalut: ""
      t.references :order, foreign_key: true
      t.timestamps
    end
  end
end
