class AddEpsToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :eps, :integer
  end
end
