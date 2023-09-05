class ChangeDataRegionIdToOrders < ActiveRecord::Migration[6.0]
  def change
    change_column :orders, :region_id, :integer
  end
end
