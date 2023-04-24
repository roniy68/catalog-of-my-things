require_relative './books'

class App
  attr_accessor :books

  def initalize
    @books = Books.new
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
      puts 'implement option 5'
    when 6
      puts 'implement option 6'
    when 7
      @books.add_book
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

  def list_items(list)
    list.each_with_index { |obj, index| print "[#{index}] - #{obj.print_data}" }
  end
end
