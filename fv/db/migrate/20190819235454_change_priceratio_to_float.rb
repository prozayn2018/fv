class ChangePriceratioToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :priceratio,  :float
  end
end
