class CreateResources < ActiveRecord::Migration[5.2]
  def change
    create_table :resources do |t|
      t.string :title
      t.integer :category_id
      t.string :url

      t.timestamps
    end
  end
end
