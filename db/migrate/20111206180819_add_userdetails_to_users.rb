class AddUserdetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :title, :string
    add_column :users, :forename, :string
    add_column :users, :lastname, :string
  end
end
