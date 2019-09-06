class ChangeRoeToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :roe,  :float
  end
end
