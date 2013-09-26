class CreateMusicians < ActiveRecord::Migration
  def change
    create_table :musicians do |t|
      t.string :name
      t.integer :search_count

      t.timestamps
    end
  end
end
