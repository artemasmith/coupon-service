class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :cid

      t.timestamps
    end
    add_index :categories, :cid
  end
end
