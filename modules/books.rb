require_relative './book'
require_relative './label'
require_relative './validator'
class Books
  include Validator
  attr_accessor :bookslist

  def initialize
    @bookslist = []
  end

  def create_book
    print "Enter book name: \n"
    name = validate_empty('Book Name')
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
      coverstate,
    )
  end

  def add_book(name, publisher, date, coverstate)
    book = Book.new(name, date, publisher, coverstate)
    @bookslist << book
    book
  end
end
