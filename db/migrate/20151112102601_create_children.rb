class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.string :name
      t.string :status
      t.integer :father_id
      t.integer :mother_id
      t.float :last_seen
      t.float :last_lon
      t.float :last_lat

      t.timestamps null: false
    end
  end
end
