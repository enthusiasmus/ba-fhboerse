class ChangeProductsTelephoneTypeMigration < ActiveRecord::Migration
  def change
    change_column :products, :telephone, :string
  end
end
