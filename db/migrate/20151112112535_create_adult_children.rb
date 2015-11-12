class CreateAdultChildren < ActiveRecord::Migration
  def change
    create_table :adult_children, :id => false do |t|
    	t.integer :adult_id
    	t.integer :child_id
    	t.string :relation
    end
  end
end
