class RenameStockId < ActiveRecord::Migration[5.2]
  def change
    rename_column :prices, :stock_id, :market_id
  end
end
