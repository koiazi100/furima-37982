class CreateShippingAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :shipping_addresses do |t|

      t.timestamps
      t.string   :postcode, null: false
      t.integer   :prefecture_id, null: false
      t.string   :city, null: false
      t.text   :block, null: false
      t.text   :building, null: false
      t.string   :phone_number, null: false
      t.references :purchase_record, null: false, foreign_key: true

    end
  end
end
