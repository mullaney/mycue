class AddUseridToScripts < ActiveRecord::Migration
  def change
    add_column :scripts, :user_id, :integer
  end
end
