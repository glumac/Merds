class ArtistsController < ApplicationController
	# require 'lib/api_search'
	include ApiSearch


	def index
		@artist = Artist.new
	end

	def show
		render text: "SHOW TEST 123"
	end


	def artist_query

		Artist.delete_all

		name = params[:artist_query].chomp.downcase
    artist = Artist.find_by_name(name)

    if !artist

    	name, words = artist_wordcount(name)

      # api stuff and save new artist
      artist = Artist.create(name: name.chomp.downcase)

      words.each do |key, value|
        ### line below is rails shortcut
        word = find_by_word(key)
        if !word
          word = Word.create(word: key)
        end

        Worduse.create(:count => value, :artist_id => artist.id, :word_id => word.id)
        ##dont need to have :count etc in attr accessable if use below method 
        # artist.worduses << worduse
        # word.worduses << worduse
      end
    end

		redirect_to artist_path(artist)

 	end


end

    






