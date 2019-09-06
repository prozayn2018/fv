class ChangeCurrentPriceToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :current_price,  :float 
  end
end
