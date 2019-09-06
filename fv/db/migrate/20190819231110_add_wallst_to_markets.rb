class AddWallstToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :wallst, :integer
  end
end
