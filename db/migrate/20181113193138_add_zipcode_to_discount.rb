class AddZipcodeToDiscount < ActiveRecord::Migration[5.2]
  def change
    add_column :discounts, :zipcode, :string
  end
end
