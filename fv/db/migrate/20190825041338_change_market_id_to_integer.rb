class ChangeMarketIdToInteger < ActiveRecord::Migration[5.2]
  def change
    change_column :prices, :market_id, :integer 
  end
end
