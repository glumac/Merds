# MERDS
####  (Music Words)

![Merds icon](http://www.glumac.net/merds_sm.png)

#####Description: 

**When a visitor types in the name of a band or artist, merds returns a word cloud of the words that appear most frequently in the artist's oeuvre.**

#####MERDS is a Rails application that works as follows: 
1. When a user for an artist, Merds to check if this artist has already been searched, and their associated words are already recorded in the Merds database.
2. If so, then words are populated in the word cloud from the database. If not, Merds hits up two APIs to collect the artists' most commonly sung words. 
	* The Musicbrains API returns a list of all the artist's albums, then performs a second search to return a list of all tracks contained on those albums.
	* These song titles are fed into the Lyricfy API, which returns lyrics for each song.
3. These artist associations are added to words in our database, with a count of how many times the words is used. The wordcloud is printed, and the next time this artist is searched, merds will not need to hit up the APIs. 
 
##### Resources
*  <http://www.http://musicbrainz.org/>
*  <https://github.com/javichito/Lyricfy>

####Notes:

Merds is my first Rails project, made after a (great) three weeks as a General Assembly WDI student. 

**To-do list**: switch APIs from Musicbrains to Songza, which isn't heavily rate-limited. The first time an artist is searched, before their most common lyrical words have been captured in the Merds databse, Heroku will time out (but continue the lyric search in the background). Merds is running with a de-populated database (to avoid Heroku charges) at [http://merds.herokuapp.com/](http://merds.herokuapp.com/)
