class AddSubstracrToSpace < ActiveRecord::Migration
  def change
    add_column :spaces, :substract, :integer
  end
end
