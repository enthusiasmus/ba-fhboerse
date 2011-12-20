class AddGeneralArticleAttributesToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :description, :text
    add_column :jobs, :counter, :integer
    add_column :jobs, :forename, :string
    add_column :jobs, :lastname, :string
    add_column :jobs, :email, :string
    add_column :jobs, :telephone, :integer
    add_column :jobs, :offer_or_quest, :boolean
    add_column :jobs, :user_id, :integer
  end
end
