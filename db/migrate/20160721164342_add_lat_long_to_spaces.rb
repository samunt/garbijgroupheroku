class AddLatLongToSpaces < ActiveRecord::Migration
  def change
    add_column :spaces, :lattitude, :string
    add_column :spaces, :longitude, :string
  end
end
