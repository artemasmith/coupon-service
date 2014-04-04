class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.text :url
      t.text :description
      t.string :name
      t.integer :category_id
      t.float :price
      t.string :currency
      t.string :out_id
      t.integer :provider_id
      t.text :img
      t.boolean :available

      t.timestamps
    end
    add_index :coupons, :name
    add_index :coupons, :url, unique: true
  end
end
