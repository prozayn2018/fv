class AddRoaToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :roa, :integer
  end
end
