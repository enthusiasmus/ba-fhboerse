class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :creator
      t.integer :counter

      t.timestamps
    end
  end
end
