class AddGeneralArticleAttributesToItems < ActiveRecord::Migration
  def change
    add_column :items, :title, :string
    add_column :items, :description, :text
    add_column :items, :counter, :integer
    add_column :items, :forename, :string
    add_column :items, :lastname, :string
    add_column :items, :email, :string
    add_column :items, :telephone, :integer
    add_column :items, :offer_or_quest, :boolean
    add_column :items, :user_id, :integer
  end
end
