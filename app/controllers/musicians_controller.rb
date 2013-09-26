class MusiciansController < ApplicationController
	# require 'lib/api_search'
	include ApiSearch


	def index
		@musician = Musician.new
	end

	def show
		render text: "SHOW TEST 123"
	end


	def musician_query

		Musician.delete_all

		name = params[:musician_query].chomp.downcase
    musician = Musician.find_by_name(name)

    if !musician

    	name, words = musician_wordcount(name)

      # api stuff and save new musician
      musician = Musician.create(name: name.chomp.downcase)

      words.each do |key, value|
        ### line below is rails shortcut
        word = find_by_word(key)
        if !word
          word = Word.create(word: key)
        end

        Worduse.create(:count => value, :musician_id => musician.id, :word_id => word.id)
        ##dont need to have :count etc in attr accessable if use below method 
        # musician.worduses << worduse
        # word.worduses << worduse
      end
    end

		redirect_to musician_path(musician)

 	end


end

    






