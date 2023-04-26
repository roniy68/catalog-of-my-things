require_relative '../modules/author'

describe Author do
  before :each do
    @author = Author.new('Harry', 'Ram')
  end
  it 'create author instance' do
    expect(@author).to be_instance_of(Author)
  end
  it '#add_item first item' do
    item = double('first game')
    allow(item).to receive(:author=)
    @author.add_item(item)
    expect(@author.items.length).to eql 1

    item2 = double('second game')
    allow(item2).to receive(:author=)
    @author.add_item(item2)
    expect(@author.items.length).to eql 2
  end
end
