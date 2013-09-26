
module ApiSearch
		# require 'musicbrainz' IF GOING TO USE MODULE ELSEWHERE
		

	include MusicBrainz

	def print_copywrite
		puts "Glumac"
	end

	def prepare_musicbrainz
		MusicBrainz.configure do |c|
		  # Application identity (required)
		  c.app_name = "My Music App"
		  c.app_version = "1.0"
		  c.contact = "support@mymusicapp.com"

		  # Cache config (optional)
		  c.cache_path = "/tmp/musicbrainz-cache"
		  c.perform_caching = true

		  # Querying config (optional)
		  c.query_interval = 0.2 # seconds
		  c.tries_limit = 200
		end
	end


	def musician_wordcount(musican_name)
		puts "COUNT THOSE WORDS!!"
		puts "****************************************"
		prepare_musicbrainz
				
		search = api_search_musician(musician_name)
		musician_releases = api_search_albums(search)
		musician_tracks = api_search_tracks(musician_releases)
		musician_lyrics = api_search_lyrics(musician_tracks)	
		words = count_words(musician_lyrics)
		name = musician_name ####TRIPLE TRIPLE CHECK THIS 

		return [name, words]

	end

	def api_search_musician(musician_name)

		query = musician_name
		
		search = MusicBrainz::Artist.find_by_name("#{query.downcase.gsub(" ", "_")}")

		return search
		
	end

	def api_search_albums(search)

		musician_releases = {}

		search.release_groups.each do |release_group|
		  if releases = release_group.releases
		    releases.each do |release|
		      if release.type == "Album"
		        if !musician_releases[release.title]
		          musician_releases[release.title] = release
		        end
		      end
		    end
		  end
		end

		return musician_releases
	
	end


	def api_search_tracks(musician_releases)

		musician_tracks = []

		musician_releases.each do |release_title, release|
		  if tracks = release.tracks
		    # p "#{release.title}: #{tracks.count}"
		    tracks.each do |track|
		      musician_tracks << track.title
		    end
		  end
		end
			return musician_tracks
	end

		#HERE IS WHERE I TAKE THE ARIST TRACKS ARRAY AND SPIT OUT LARGE HASH OF LYRICS AND COUNT

	def api_search_lyrics(musician_tracks)	

		musician_lyrics = []

		fetcher = Lyricfy::Fetcher.new

		musician_tracks.uniq.each do |title|
		  song = fetcher.search query, "#{title}"
		  if song
		    s = song.body.downcase.gsub(/\\n/, " ").gsub(',', "") # prints lyrics separated by '\n'
		    words = s.split
		    musician_lyrics << words
		  end
		end

		return musician_lyrics

	end


	# THIS IS REALLY WHAT DEFINE FREQUENCY IS DOING WITH NORMAl LONGER SYNTAX
	def count_words(text_block)

		text_array = text_block.split
    words = Hash.new(0);
    text_array.each{ |a_word| words[a_word.downcase] += 1 }

    return words
	end

end

	# def frequency
	# 	  	name = MusicBrainz::musician.find_by_name("#{query.downcase.gsub(" ", "_")}")
	# 	    words = Hash.new(0); each{ |v| words[v] += 1 }; words
	#  end

	# 	  return [name, words]
	# 	  ####   NEED TO GET NAME FROM MUSICBRAINS HAVENT DONE YET

	# end







