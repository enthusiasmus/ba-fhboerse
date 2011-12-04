class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.boolean :paid
      t.decimal :salary
      t.string :type
      t.string :company
      t.date :begindate
      t.string :place
      t.text :qualification

      t.timestamps
    end
  end
end
