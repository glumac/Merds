class CreateWordusesTable < ActiveRecord::Migration
  def change
    create_table :worduses, :id => false do |t|
   	 t.integer :artist_id
   	 t.integer :word_id
   end
  end
end



