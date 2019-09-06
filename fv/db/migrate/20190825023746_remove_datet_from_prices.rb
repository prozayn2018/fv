class RemoveDatetFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :datet, :varchar
  end
end
