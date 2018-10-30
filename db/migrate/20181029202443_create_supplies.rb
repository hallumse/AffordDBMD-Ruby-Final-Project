class CreateSupplies < ActiveRecord::Migration[5.2]
  def change
    create_table :supplies do |t|
      t.string :name
      t.string :upc

      t.timestamps
    end
  end
end
