class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.decimal :cost_price
      t.decimal :retail_price
      t.string :supplier
      t.integer :inventory

      t.timestamps
    end
  end
end
