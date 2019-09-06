class AddMarketcapToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :marketcap, :integer
  end
end
