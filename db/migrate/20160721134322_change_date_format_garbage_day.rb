class ChangeDateFormatGarbageDay < ActiveRecord::Migration
  def change
    change_column :spaces, :garbaje_day, :string
  end
end
