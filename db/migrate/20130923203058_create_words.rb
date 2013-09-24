class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.boolean :is_common
      t.integer :search_count

      t.timestamps
    end
  end
end
