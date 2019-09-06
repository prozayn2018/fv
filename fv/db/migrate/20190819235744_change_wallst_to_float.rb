class ChangeWallstToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :wallst,  :float 
  end
end
