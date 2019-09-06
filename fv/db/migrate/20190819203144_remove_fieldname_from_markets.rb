class RemoveFieldnameFromMarkets < ActiveRecord::Migration[5.2]
  def change
    remove_column :markets, :fieldname, :integer
  end
end
