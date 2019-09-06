class RemoveStockidFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :stockid, :integer
  end
end
