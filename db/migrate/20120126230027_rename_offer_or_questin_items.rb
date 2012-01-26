class RenameOfferOrQuestinItems < ActiveRecord::Migration
  def change
    rename_column :items, :offer_or_quest, :isOffer
  end
end
