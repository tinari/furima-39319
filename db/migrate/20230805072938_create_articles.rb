class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.integer     :category_id,         null: false
      t.integer     :situation_id,        null: false
      t.integer     :delivery_charge_id,  null: false
      t.integer     :region_id,           null: false
      t.integer     :shipment_id,         null: false 
      t.timestamps
    end
  end
end
