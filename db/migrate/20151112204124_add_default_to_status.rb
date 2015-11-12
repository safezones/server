class AddDefaultToStatus < ActiveRecord::Migration
  def change
  	change_column :children, :status, :string, :default => ""
  end
end
