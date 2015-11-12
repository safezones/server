class AddTochildLastAddress < ActiveRecord::Migration
  def change
  	add_column :children, :last_address, :string
  end
end
