require_relative '../modules/books'

describe Books do
  before :each do
    @books = Books.new
  end

  it '#add_book' do
    book = @books.add_book('Troy', 'Penguin', '2022-12-12', 'good')
    expect(book).to be_instance_of(Book)
  end
end
