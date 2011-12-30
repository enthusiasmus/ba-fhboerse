class DropSessionsTable < ActiveRecord::Migration
  def up
    drop_table :sessions
  end

  def down
    create_table :sessions
  end
end
