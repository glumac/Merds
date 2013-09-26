class AddCountToWordusesTable < ActiveRecord::Migration
  def up
    add_column :worduses, :count, :integer
  end

  def down
    remove_column :worduses, :count, :integer
  end
end
