class RemoveCreatedAtFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :created_at, :datetime
  end
end
