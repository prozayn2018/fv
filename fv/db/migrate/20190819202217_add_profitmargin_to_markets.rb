class AddProfitmarginToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :profitmargin, :integer
  end
end
