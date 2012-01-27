class RenameProductIsoffer < ActiveRecord::Migration
  def change
	rename_column :products, :isOffer, :is_offer
  end
end
