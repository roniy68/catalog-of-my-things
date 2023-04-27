require_relative './music_album'
require_relative './validator'
class MusicAlbums
  include Validator
  attr_accessor :albumlist

  def initialize
    @albumlist = []
  end

  def create_music_album
    print "Enter Album name: \n"
    name = validate_empty('Music Album')
    print "Enter release date [YYYY-MM-DD]: \n"
    date = validate_date
    print "Available on Spotify? [yes/no]: \n"
    option1 = validate_empty('On Spotify?')
    onspotify = option1.downcase == 'yes' || option1.downcase == 'y'
    add_music_album(capitalize_text(name), date, onspotify)
  end

  def add_music_album(name, date, onspotify)
    music_album = MusicAlbum.new(name, date, onspotify)
    @albumlist << music_album
    music_album
  end
end
