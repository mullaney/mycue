class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.integer :scene_id, null: false
      t.integer :character_id, null: false
      t.string :cue, null: false
      t.string :line, null: false
      t.integer :order, null: false

      t.timestamps
    end
  end
end
