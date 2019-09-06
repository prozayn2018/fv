class AddGrossprofitToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :grossprofit, :integer
  end
end
