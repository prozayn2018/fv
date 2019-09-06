class AddPricebookToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :pricebook, :integer
  end
end
