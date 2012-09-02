class RemoveColumnFromScripts < ActiveRecord::Migration
  def up
  	remove_column :lines, :character_id
  end

  def down
  	add_column :lines, :character_id, :integer, null: false
  end
end
