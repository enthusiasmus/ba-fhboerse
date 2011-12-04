class AddTypeToDrive < ActiveRecord::Migration
  def change
    add_column :drives, :type, :boolean
  end
end
