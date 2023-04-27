require_relative './genre'
require_relative './validator'

class Genres
  include Validator
  attr_accessor :genreslist

  def initialize
    @genreslist = []
  end

  def create_genre(item)
    print "Enter Genre: \n"
    genrename = validate_empty('Genre')
    add_genre(item, genrename)
  end

  def add_genre(item, name)
    existing_genre =
      @genreslist.find { |genre| genre.name.downcase == name.downcase }
    if existing_genre
      existing_genre.add_item(item)
    else
      new_genre = Genre.new(name)
      new_genre.add_item(item)
      @genreslist << new_genre
    end
  end
end
