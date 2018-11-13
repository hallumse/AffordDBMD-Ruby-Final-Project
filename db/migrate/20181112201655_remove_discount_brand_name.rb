class RemoveDiscountBrandName < ActiveRecord::Migration[5.2]
  def change
    remove_column :discounts, :brand
    add_column :supplies, :brand, :string
  end
end
