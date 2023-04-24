require_relative './book'
class Books
  attr_read :bookslist
  def initialize
    @bookslist = []
  end

  def add_book; end
end
