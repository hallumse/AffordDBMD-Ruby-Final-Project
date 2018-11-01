class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :brand
      t.string :form
      t.string :dosage
      t.string :quantity
      t.string :price
      t.string :pharmacy

      t.timestamps
    end
  end
end
