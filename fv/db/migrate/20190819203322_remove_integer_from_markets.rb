class RemoveIntegerFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :integer, :integer
  end
end
