require_relative '../modules/genre'

describe Genre do
  before :each do
    @genre = Genre.new('Hardrock')
  end

  it '#add_item method test' do
    item = double('album')
    allow(item).to receive(:genre=)
    @genre.add_item(item)
    expect(@genre.items.length).to eql 1

    item2 = double('Book')
    allow(item2).to receive(:genre=)
    @genre.add_item(item2)
    expect(@genre.items.length).to eql 2
  end

  it '#initialize genre' do
    expect(@genre).to be_instance_of(Genre)
  end
end
