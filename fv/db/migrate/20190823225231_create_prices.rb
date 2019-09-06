class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.float :stock_id
      t.string :compsymb
      t.string :string
      t.string :datet
      t.string :datetime
      t.string :stock_price
      t.string :float

      t.timestamps
    end
  end
end
