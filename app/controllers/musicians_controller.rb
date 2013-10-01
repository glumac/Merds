class MusiciansController < ApplicationController
  # require 'lib/api_search'
  include ApiSearch


  def index
    @musician = Musician.new
  end

  def show
    musician = Musician.find(params[:id])
    @worduse = Worduse.where(:musician_id => musician.id)
              # Person.where(:user_name => "xyz", :status => ["active", "deleted"])
    puts @worduse
  end


  def musician_query

    # THIS IS HACKED TO AVOID BEING CHARGED MONEY
    if Musician.all.count + Worduse.all.count + Word.all.count >= 8000
      Worduse.delete_all
      Musician.delete_all
      Word.delete_all
    end


    @musician_name = params[:musician_query].downcase
    musician = Musician.find_by_name(@musician_name)

    if !musician
      musician_wordcount(@musician_name)
      words = musician_wordcount(@musician_name)
      # api stuff and save new musician
      
      musician = Musician.create(name: @musician_name)
      
      words[1].each do |key, value|

        ### line below is rails shortcut

        word = Word.find_by_word(key)
        if !word
          word = Word.create(word: key)
        end

        Worduse.create(:count => value, :musician_id => musician.id, :word_id => word.id)
      end
    end

    redirect_to musician_path(musician)

  end
end


  def api_search_musician(musician_name)

    query = musician_name
    search = MusicBrainz::Artist.find_by_name("#{query.downcase.gsub(" ", "_")}")
    return search

  end




