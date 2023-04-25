require_relative '../modules/label.rb'

describe Label do
  before :each do
    @label = Label.new('gift', 'green')
  end
  it 'create lable instance' do
    expect(@label).to be_instance_of(Label)
  end
  it '#add_item first item' do
    item = double('first book')
    allow(item).to receive(:label=)
    @label.add_item(item)
    expect(@label.items.length).to eql 1

    item2 = double('second book')
    allow(item2).to receive(:label=)
    @label.add_item(item2)
    expect(@label.items.length).to eql 2
  end
end
