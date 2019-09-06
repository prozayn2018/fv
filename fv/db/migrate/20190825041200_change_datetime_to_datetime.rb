class ChangeDatetimeToDatetime < ActiveRecord::Migration[5.2]
  def change
    change_column :prices, :datetime, :datetime 
  end
end
