class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :postcode,             null: false
      t.integer :prefecture_id,       null: false
      t.string :municipality,         null: false
      t.string :address,              null: false
      t.string :phonenumber,          null: false
      t.string :building_name
      t.references :buy,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
