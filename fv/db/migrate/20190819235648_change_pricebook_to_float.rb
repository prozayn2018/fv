class ChangePricebookToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :pricebook,  :float 
  end
end
