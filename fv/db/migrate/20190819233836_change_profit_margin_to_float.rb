class ChangeProfitMarginToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :profitmargin,  :float 
  end
end
