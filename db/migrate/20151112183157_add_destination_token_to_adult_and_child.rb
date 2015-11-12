class AddDestinationTokenToAdultAndChild < ActiveRecord::Migration
  def change
  	add_column :children, :destination_token, :string, default: ""
  	add_column :adults, :destination_token, :string, default: ""
  end
end