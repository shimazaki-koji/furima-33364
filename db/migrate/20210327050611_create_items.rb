class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false, default: ""
      t.text :explanatory_text, null: false
      t.integer :category_id, null: false
      t.integer :product_condition_id, null: false
      t.integer :delivery_fee_id, null: false
      t.integer :shipment_id, null: false
      t.integer :days_to_ship_id, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
