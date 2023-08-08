class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :item,                 null: false
      t.integer :price,               null: false
      t.references :user,             null: false, foreign_key: true 
      t.text :content,                null: false                    
      t.integer :category_id,         null: false                    
      t.integer :situation_id,        null: false                     
      t.integer :delivery_charge_id,  null: false                    
      t.integer :region_id,           null: false                    
      t.integer :shipment_id,         null: false                    
      t.timestamps
    end
  end
end
