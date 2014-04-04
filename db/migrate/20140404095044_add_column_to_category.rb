class AddColumnToCategory < ActiveRecord::Migration
  def change
    add_column :categories, :provider_id, :integer
  end
end
