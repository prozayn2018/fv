class AddPriceratioToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :priceratio, :integer
  end
end
