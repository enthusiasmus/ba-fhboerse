class RenameOfferOrQuestinDrives < ActiveRecord::Migration
  def change
    rename_column :drives, :offer_or_quest, :isOffer
  end
end
