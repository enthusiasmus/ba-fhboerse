class RenameUsersForename < ActiveRecord::Migration
  def change
    rename_column :users, :forename, :firstname
  end
end
