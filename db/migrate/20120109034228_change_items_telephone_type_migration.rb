class ChangeItemsTelephoneTypeMigration < ActiveRecord::Migration
  def change
    change_column :items, :telephone, :string
  end
end
