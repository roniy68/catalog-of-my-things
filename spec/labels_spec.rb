require_relative '../modules/labels'

describe Labels do
  before :all do
    @labels = Labels.new
  end
  it '#add_label' do
    item = double('item')
    allow(item).to receive(:label=)
    @labels.add_label(item, 'gift', 'red')
    expect(@labels.labelslist.length).to eql 1
  end

  it '#add_label existing label' do
    item2 = double('item2')
    allow(item2).to receive(:label=)
    @labels.add_label(item2, 'gift', 'red')
    expect(@labels.labelslist.length).to eql 1
  end
end
