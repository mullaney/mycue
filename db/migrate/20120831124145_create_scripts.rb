class CreateScripts < ActiveRecord::Migration
  def change
    create_table :scripts do |t|
      t.string :title, null: false

      t.timestamps
    end
  end
end
