require_relative './item'
class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(name, published_date, on_spotify)
    super(name, published_date)
    @on_spotify = on_spotify
  end

  def can_be_archived?
    return true if super && @on_spotify == true

    false
  end

  def print_data
    "Album Name - #{@name} | Artist - #{@author.first_name} #{@author.last_name} " \
      "| On Spotify - #{@on_spotify}\n"
  end

  def create_json
    albumhash = {
      type: 'Album',
      name: @name,
      date: @publish_date,
      onspotify: @on_spotify,
      labeltitle: @label.title,
      labelcolor: @label.color,
      genre: @genre.name,
      auth_fname: @author.first_name,
      auth_lname: @author.last_name
    }
    JSON.generate(albumhash)
  end
end
