class RemoveCreatedAtFromPrices < ActiveRecord::Migration[5.2]
  def change
    remove_column :prices, :created_at, :datetime
  end
end
