require_relative '../modules/music_album'

describe 'MusicAlbum' do
  before :each do
    @album = MusicAlbum.new('zeit', '2022-04-25', true)
    label = double('label')
    allow(label).to receive(:title) { 'new album' }
    allow(label).to receive(:color) { 'blue' }
    allow(label).to receive(:items) { [] }
    @album.label = label
    author = double('author')
    allow(author).to receive(:first_name) { 'rammstein' }
    allow(author).to receive(:last_name) { 'rm' }
    allow(author).to receive(:items) { [] }
    @album.author = author
    genre = double('genre')
    allow(genre).to receive(:name) { 'hard metal' }
    allow(genre).to receive(:items) { [] }
    @album.genre = genre
  end

  it '#initialize creates book instance' do
    expect(@album).to be_instance_of(MusicAlbum)
    expect(@album).to be_kind_of(Item)
  end

  it '#create_json' do
    expect(@album.create_json).not_to be_nil
    expect(@album.create_json).to be_instance_of(String)
  end

  it '#print_data' do
    expect(
      @album.print_data
    ).to eql 'Album Name - zeit | Artist - rammstein rm | ' \
             "On Spotify - true\n"
  end
end
