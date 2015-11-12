class CreateSafeZones < ActiveRecord::Migration
  def change
    create_table :safe_zones do |t|
      t.float :lat
      t.float :lon
      t.integer :category_id
      t.float :radius
      t.string :address

      t.timestamps null: false
    end
  end
end
