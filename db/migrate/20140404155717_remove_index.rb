class RemoveIndex < ActiveRecord::Migration
  def change
    remove_index :coupons, :url
  end
end
