require_relative './books'
require_relative './games'
require_relative './music_albums'
require_relative './labels'
require_relative './authors'
require_relative './genres'
require_relative './json_helper'

class App
  attr_accessor :books

  BOOKFILE = './data/books.json'.freeze
  GAMEFILE = './data/games.json'.freeze
  ALBUMFILE = './data/albums.json'.freeze
  def initialize
    @books = Books.new
    @games = Games.new
    @albums = MusicAlbums.new
    @labels = Labels.new
    @authors = Authors.new
    @genres = Genres.new
    read_files
  end

  def evaluate_options(option)
    case option
    when 1
      list_items(@books.bookslist, 'Books')
    when 2
      list_items(@albums.albumlist, 'Albums')
    when 3
      list_items(@games.gameslist, 'Games')
    when 4
      list_items(@genres.genreslist, 'Genres')
    when 5
      list_items(@labels.labelslist, 'Labels')
    else
      evaluate_options1(option)
    end
  end

  def evaluate_options1(option)
    case option
    when 6
      list_items(@authors.authorslist, 'Authors')
    when 7
      book = @books.create_book
      add_attributes(book)
    when 8
      album = @albums.create_music_album
      add_attributes(album)
    when 9
      game = @games.create_game
      add_attributes(game)
    else
      print "Please enter a valid option:\n"
    end
  end

  def add_attributes(item)
    @authors.create_author(item)
    @genres.create_genre(item)
    @labels.create_label(item)
  end

  def list_items(list, msg)
    print "List is empty. Please add some #{msg}\n" if list.empty?
    list.each_with_index do |obj, index|
      print "[#{index + 1}] - #{obj.print_data}"
      unless obj.instance_of?(Label) || obj.instance_of?(Genre) ||
             obj.instance_of?(Author)
        next
      end

      obj.items.each_with_index do |item, i|
        print "\t(#{i + 1}) #{item.print_data}"
      end
    end
  end

  def read_files
    create_objs_from_file(JsonHelper.read_from_json(BOOKFILE))
    create_objs_from_file(JsonHelper.read_from_json(GAMEFILE))
    create_objs_from_file(JsonHelper.read_from_json(ALBUMFILE))
  end

  def write_files
    JsonHelper.write_to_json(@books.bookslist, BOOKFILE)
    JsonHelper.write_to_json(@games.gameslist, GAMEFILE)
    JsonHelper.write_to_json(@albums.albumlist, ALBUMFILE)
  end

  def create_objs_from_file(hashlist)
    hashlist.each do |obj|
      item =
        if obj['type'] == 'Book'
          create_book_obj(obj)
        elsif obj['type'] == 'Game'
          create_game_obj(obj)
        else
          create_album_obj(obj)
        end

      @labels.add_label(item, obj['labeltitle'], obj['labelcolor'])
      @genres.add_genre(item, obj['genre'])
      @authors.add_author(item, obj['auth_fname'], obj['auth_lname'])
    end
  end

  def create_book_obj(obj)
    @books.add_book(
      obj['name'],
      obj['publisher'],
      obj['date'],
      obj['cover_state']
    )
  end

  def create_game_obj(obj)
    @games.add_game(
      obj['name'],
      obj['multiplayer'],
      obj['date'],
      obj['last_played_at']
    )
  end

  def create_album_obj(obj)
    @albums.add_music_album(obj['name'], obj['date'], obj['onspotify'])
  end
end
