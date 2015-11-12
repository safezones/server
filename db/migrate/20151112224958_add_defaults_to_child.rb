class AddDefaultsToChild < ActiveRecord::Migration
  def change
	change_column :children, :name, :string, :default => ""
  end
end
