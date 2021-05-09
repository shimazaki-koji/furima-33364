class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code, null: false, default: ""
      t.integer :shipment_id, null: false
      t.string :city, null: false, defalut: ""
      t.string :address, null: false, defalut: ""
      t.string :building, defalut: ""
      t.string :phone_number, null: false, defalut: ""
      t.references :order, null: false, foreign_key: true
      t.timestamps
    end
  end
end
