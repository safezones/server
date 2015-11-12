class AddChildIdToCategory < ActiveRecord::Migration
  def change
	add_column :categories, :name, :string
	add_column :categories, :child_id, :integer
  end
end
