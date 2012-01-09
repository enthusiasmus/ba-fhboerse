class AddTypeToDrives < ActiveRecord::Migration
  def change
    rename_column :drives, :type, :drivetype
    add_column :drives, :type, :string
  end
end
