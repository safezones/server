class ChangeDefaultOfToken < ActiveRecord::Migration
  def change
  	change_column :adults, :destination_token, :string, :default => ""
  	change_column :children, :destination_token, :string, :default => ""
  end
end
