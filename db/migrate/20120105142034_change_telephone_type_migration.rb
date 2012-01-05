class ChangeTelephoneTypeMigration < ActiveRecord::Migration
  def change
    change_column(:jobs, :telephone, :string)
  end
end
