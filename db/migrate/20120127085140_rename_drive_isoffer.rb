class RenameDriveIsoffer < ActiveRecord::Migration
  def change
	rename_column :drives, :isOffer, :is_offer
  end
end
