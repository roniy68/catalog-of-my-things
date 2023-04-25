require_relative './books'
require_relative './labels'
require_relative './json_helper'

class App
  attr_accessor :books

  BOOKFILE = './data/books.json'.freeze
  def initialize
    @books = Books.new
    @labels = Labels.new
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
      puts 'implement option 3'
    when 4
      puts 'implement option 4'
    when 5
      list_items(@labels.labelslist)
    when 6
      puts 'implement option 6'
    when 7
      book = @books.create_book
      add_attributes(book)
    when 8
      puts 'implement option 8'
    when 9
      puts 'implement option 9'
    else
      print "Please enter a valid option:\n"
    end
  end
  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength

  def add_attributes(item)
    @labels.create_label(item)
  end

  def list_items(list)
    list.each_with_index { |obj, index| print "[#{index}] - #{obj.print_data}" }
  end

  def read_files
    create_objs_from_file(JsonHelper.read_from_json(BOOKFILE))
  end

  def write_files
    JsonHelper.write_to_json(@books.bookslist, BOOKFILE)
  end

  def create_objs_from_file(hashlist)
    hashlist.each do |obj|
      item = nil
      if obj['type'] == 'Book'
        item =
          @books.add_book(
            obj['name'],
            obj['publisher'],
            obj['date'],
            obj['cover_state']
          )
      end
      @labels.add_label(item, obj['labeltitle'], obj['labelcolor'])
    end
  end
end
