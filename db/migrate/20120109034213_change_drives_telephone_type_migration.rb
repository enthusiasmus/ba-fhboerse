class ChangeDrivesTelephoneTypeMigration < ActiveRecord::Migration
  def change
    change_column :drives, :telephone, :string
  end
end
