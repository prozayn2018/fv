class AddEbitdaToMarkets < ActiveRecord::Migration[5.2]
  def change
    add_column :markets, :ebitda, :integer
  end
end
