class RenameOfferOrQuestinJobs < ActiveRecord::Migration
  def change
    rename_column :jobs, :offer_or_quest, :isOffer
  end
end
