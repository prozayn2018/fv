class ChangeEpsToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :eps,  :float
  end
end
