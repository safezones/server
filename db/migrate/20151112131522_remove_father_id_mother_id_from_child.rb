class RemoveFatherIdMotherIdFromChild < ActiveRecord::Migration
  def change
  	remove_column :children, :father_id
  	remove_column :children, :mother_id
  end
end
