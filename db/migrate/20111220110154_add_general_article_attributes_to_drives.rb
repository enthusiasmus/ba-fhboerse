class AddGeneralArticleAttributesToDrives < ActiveRecord::Migration
  def change
    add_column :drives, :title, :string
    add_column :drives, :description, :text
    add_column :drives, :counter, :integer
    add_column :drives, :forename, :string
    add_column :drives, :lastname, :string
    add_column :drives, :email, :string
    add_column :drives, :telephone, :integer
    add_column :drives, :offer_or_quest, :boolean
    add_column :drives, :user_id, :integer
  end
end
