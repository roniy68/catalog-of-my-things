require_relative './book'
require_relative './label'
class Books
  attr_accessor :bookslist

  def initialize
    @bookslist = []
  end

  def create_book
    print "Enter book name: \n"
    name = gets.chomp
    print "Enter publisher name: \n"
    publisher = gets.chomp
    print "Enter publish date [YYYY-MM-DD]: \n"
    date = gets.chomp
    print "Cover state [new/good/bad]: \n"
    coverstate = gets.chomp
    add_book(name, publisher, date, coverstate)
  end

  def add_book(name, publisher, date, coverstate)
    book = Book.new(name, date, publisher, coverstate)
    @bookslist << book
    book
  end
end
