require_relative '../modules/book'

describe Book do
  before :each do
    @book = Book.new('Math Basic', '2022-12-12', 'Penguin', 'good')
    label = double('label')
    allow(label).to receive(:title) { 'dummy title' }
    allow(label).to receive(:color) { 'dummy color' }
    @book.label = label
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
    ).to eql "Book Title - Math Basic | Publisher - Penguin | Date - 2022-12-12 | State - good\n"
  end
end
