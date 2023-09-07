class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string       :address,        null: false 
      t.integer      :region_id,      null: false     
      t.string       :municipality,   null: false                    
      t.string       :house_number,   null: false                    
      t.string       :building_name 
      t.string       :tel,            null: false        
      t.references   :buy,            null: false, forgen_key: true 
      t.timestamps
    end
  end
end
