class AddRoeToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :roe, :integer
  end
end
