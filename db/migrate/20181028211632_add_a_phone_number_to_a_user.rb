class AddAPhoneNumberToAUser < ActiveRecord::Migration[5.2]
  def change
    add_a_phone_number :users, :number
  end
end
