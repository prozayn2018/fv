class RemoveStringFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :string, :varchar
  end
end
