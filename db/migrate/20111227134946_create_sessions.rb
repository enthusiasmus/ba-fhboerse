class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :provider
      t.string :uid
      t.string :name

      t.timestamps
    end
  end
end
