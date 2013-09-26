
require_relative '../api_search.rb'
include ApiSearch

task :populate_words do

	musicians = Musician.all
	musicians.each do |musician|
		if !musician.words
		 
      words = musician_wordcount(musician.name)
      
      musician = Musician.create(name: musician.name)
      binding.pry
      words.each do |key, value|
        ### line below is rails shortcut
        word = find_by_word(key)
        if !word
          word = Word.create(word: key)
        end
        Worduse.create(:count => value, :musician_id => musician.id, :word_id => word.id)
      end
		end
	end

	musicians = Musician.all
	musicians.each do |musician|
		if !musician.words
			musician.destroy
		end
	end

end
