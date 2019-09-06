class ChangeStockPriceToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :prices, :stock_price, :float
  end
end
