class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name, null: false
      t.integer :script_id, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
