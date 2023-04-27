require_relative '../modules/book'

describe Book do
  before :each do
    @book = Book.new('Math Basic', '2022-12-12', 'Penguin', 'good')
    label = double('label')
    allow(label).to receive(:title) { 'dummy title' }
    allow(label).to receive(:color) { 'dummy color' }
    allow(label).to receive(:items) { [] }
    @book.label = label
    author = double('author')
    allow(author).to receive(:first_name) { 'firstname' }
    allow(author).to receive(:last_name) { 'lastname' }
    allow(author).to receive(:items) { [] }
    @book.author = author
    genre = double('genre')
    allow(genre).to receive(:name) { 'dummy genre' }
    allow(genre).to receive(:items) { [] }
    @book.genre = genre
  end
  it 'create book instance' do
    expect(@book).to be_instance_of(Book)
    expect(@book).to be_kind_of(Item)
  end
  it '#create_json' do
    expect(@book.create_json).not_to be_nil
    expect(@book.create_json).to be_instance_of(String)
  end

  it '#print_data' do
    expect(
      @book.print_data
    ).to eql 'Book Title - Math Basic | Author: firstname lastname | ' \
             "Publisher - Penguin | Publish date - 2022-12-12 | State - good\n"
  end
end
