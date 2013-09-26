class AddColumnToWorduses < ActiveRecord::Migration
  def up
    add_column :worduses, :id, :primary_key
  end

  def down
    add_column :worduses, :id, :primary_key
  end
end
