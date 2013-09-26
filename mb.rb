require 'musicbrainz'


MusicBrainz.configure do |c|
  # Application identity (required)
  c.app_name = "My Music App"
  c.app_version = "1.0"
  c.contact = "support@mymusicapp.com"

  # Cache config (optional)
  c.cache_path = "/tmp/musicbrainz-cache"
  c.perform_caching = true

  # Querying config (optional)
  c.query_interval = 1.2 # seconds
  c.tries_limit = 2
end


artist_tracks = []

artist = MusicBrainz::Artist.find_by_name("Vampire Weekend")

@artist.release_groups.each do |release_group|
	begin 
		release_group.releases.each do |release|
			release.tracks.uniq.each do |track|
				artist_tracks << track.title.to_s
			end
		end
	
	rescue
		puts "no release"
	end
end
