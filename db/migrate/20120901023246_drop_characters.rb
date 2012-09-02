class DropCharacters < ActiveRecord::Migration
  def up
  	drop_table :characters
  end

  def down
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :script_id, null: false

      t.timestamps
    end
  end
end
