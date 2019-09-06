class CreateMarkets < ActiveRecord::Migration[5.2]
  def change
    create_table :markets do |t|
      t.string :symbol
      t.string :name
      t.integer :current_price
      t.integer :fair_value
      t.integer :discount_value
      t.integer :YTD_change

      t.timestamps
    end
  end
end
