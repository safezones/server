class AddPhoneNumberToAdult < ActiveRecord::Migration
  def change
	add_column :adults, :phone_number, :string, default: ""
  end
end
