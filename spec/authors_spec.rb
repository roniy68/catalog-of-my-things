require_relative '../modules/authors'

describe Authors do
  before :all do
    @authors = Authors.new
  end
  it '#add_author' do
    item = double('item')
    allow(item).to receive(:author=)
    @authors.add_author(item, 'Harry', 'Ram')
    expect(@authors.authorslist.length).to eql 1
  end

  it '#add_author existing author' do
    item2 = double('item2')
    allow(item2).to receive(:author=)
    @authors.add_author(item2, 'Harry', 'Ram')
    expect(@authors.authorslist.length).to eql 1
  end
end
