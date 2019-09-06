class RemoveUpdatedAtFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :updated_at, :datetime
  end
end
