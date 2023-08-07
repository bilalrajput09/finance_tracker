class UpdateStockPriceColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :stocks, :price, :last_price
  end
end
