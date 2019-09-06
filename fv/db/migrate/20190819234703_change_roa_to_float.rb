class ChangeRoaToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :roa,  :float 
  end
end
