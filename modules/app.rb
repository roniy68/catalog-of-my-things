require_relative './books'
require_relative './labels'
require_relative './authors'
require_relative './games'
require_relative './json_helper'
require 'pry'

class App
  attr_accessor :books

  BOOKFILE = './data/books.json'.freeze
  GAMEFILE = './data/games.json'.freeze
  def initialize
    @books = Books.new
    @labels = Labels.new
    @games = Games.new
    @authors = Authors.new
    read_files
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  # rubocop:disable Metrics/MethodLength
  def evaluate_options(option)
    case option
    when 1
      list_items(@books.bookslist)
    when 2
      puts 'implement option 2'
    when 3
      list_items(@games.gameslist)
    when 4
      puts 'implement option 4'
    when 5
      list_items(@labels.labelslist)
    when 6
      list_items(@authors.authorslist)
    when 7
      book = @books.create_book
      add_attributes(book)
    when 8
      puts 'implement option 8'
    when 9
      game = @games.create_game
      add_attributes(game)
    else
      print "Please enter a valid option:\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  def add_attributes(item)
    @labels.create_label(item)
    @authors.create_author(item)
  end

  def list_items(list)
    list.each_with_index do |obj, index|
      print "[#{index + 1}] - #{obj.print_data}"
      next unless obj.instance_of?(Label)

      obj.items.each_with_index do |item, i|
        print "\t(#{i + 1}) #{item.print_data}"
      end
    end
  end

  def read_files
    create_objs_from_file(JsonHelper.read_from_json(BOOKFILE))
    create_objs_from_file(JsonHelper.read_from_json(GAMEFILE))
  end

  def write_files
    JsonHelper.write_to_json(@books.bookslist, BOOKFILE)
    JsonHelper.write_to_json(@games.gameslist, GAMEFILE)
  end

  def create_objs_from_file(hashlist)
    hashlist.each do |obj|
      item = nil
      if obj['type'] == 'Book'
        item = create_book_obj(obj)
      elsif obj['type'] == 'Game'
        item = create_game_obj(obj)
      end

      @labels.add_label(item, obj['labeltitle'], obj['labelcolor'])
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
end
