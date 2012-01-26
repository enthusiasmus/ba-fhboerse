class AddDefaultValueToDrives < ActiveRecord::Migration
  def change
    change_column :drives, :counter, :integer, :default => 0
  end
end
