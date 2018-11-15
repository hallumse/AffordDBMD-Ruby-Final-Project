class AddPhoneAndZipcodeToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :phone, :string
    # add_column :users, :number, :string
    add_column :users, :zipcode, :string
  end
end
