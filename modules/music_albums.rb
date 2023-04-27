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
    print "Enter publisher name: \n"
    publisher = validate_empty('Publisher')
    print "Enter publish date [YYYY-MM-DD]: \n"
    date = validate_date
    print "Cover state [new/good/bad]: \n"
    coverstate = validate_empty('Cover state [new/good/bad]')
    add_book(
      capitalize_text(name),
      capitalize_text(publisher),
      date,
      coverstate
    )
  end

  def add_music_album(name, publisher, date, coverstate)
    music_album = MusicAlbum.new(name, date, publisher, coverstate)
    @albumlist << music_album
    book
  end
end
