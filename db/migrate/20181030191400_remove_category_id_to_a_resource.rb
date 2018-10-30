class RemoveCategoryIdToAResource < ActiveRecord::Migration[5.2]
  def change
    remove_column :resources, :category_id, :integer
  end
end
