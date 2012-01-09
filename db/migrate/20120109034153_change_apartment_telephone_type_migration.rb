class ChangeApartmentTelephoneTypeMigration < ActiveRecord::Migration
  def change
    change_column :apartments, :telephone, :string
  end
end
