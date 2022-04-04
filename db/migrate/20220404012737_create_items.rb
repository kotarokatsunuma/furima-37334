class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :title
      t.text :concept
      t.references :user, null: false, foreign_key: true
      t.integer :category_id
      t.integer :status_id
      t.integer :load_id
      t.integer :prefecture_id
      t.integer :shipping_day_id
      t.integer :price
      t.timestamps
    end
  end
end
