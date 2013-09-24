class AddCountToArtistsWordsTable < ActiveRecord::Migration
  def up
    add_column :artists_words, :count, :integer
  end

  def down
    remove_column :artists_words, :count, :integer
  end
end
