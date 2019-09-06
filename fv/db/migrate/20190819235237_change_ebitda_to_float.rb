class ChangeEbitdaToFloat < ActiveRecord::Migration[5.2]
  def change
    change_column :markets, :ebitda,  :float
  end
end
