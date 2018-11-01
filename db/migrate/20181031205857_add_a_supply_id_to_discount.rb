class AddASupplyIdToDiscount < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :supply_id, :integer
  end
end
