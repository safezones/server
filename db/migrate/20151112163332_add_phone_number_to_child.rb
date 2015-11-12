class AddPhoneNumberToChild < ActiveRecord::Migration
  def change
  	add_column :children, :phone_number, :string, default: ""
  end
end
