class CreateSpaces < ActiveRecord::Migration
  def change
    create_table :spaces do |t|
      t.integer :capacity
      t.date :garbaje_day
      t.integer :user_id
      t.string :address

      t.timestamps null: false
    end
  end
end
