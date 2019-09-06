class RemoveFloatFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :float, :varchar
  end
end
