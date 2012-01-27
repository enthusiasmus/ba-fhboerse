class RenameItemIsoffer < ActiveRecord::Migration
  def change
	rename_column :items, :isOffer, :is_offer
  end
end
