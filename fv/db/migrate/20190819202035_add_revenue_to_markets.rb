class AddRevenueToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :revenue, :integer
  end
end
