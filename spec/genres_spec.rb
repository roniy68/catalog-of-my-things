require_relative '../modules/genres'

describe Genres do
  before :all do
    @genres = Genres.new
  end
  it '#add_genre 1st genre' do
    album = double('item')
    allow(album).to receive(:genre=)
    @genres.add_genre(album, 'hard metal')
    expect(@genres.genreslist.length).to eql 1
  end
  it '#add_genre item of same genre' do
    album = double('item')
    allow(album).to receive(:genre=)
    @genres.add_genre(album, 'hard metal')
    expect(@genres.genreslist.length).to eql 1
  end
  it '#add_genre item of new genre' do
    album = double('item')
    allow(album).to receive(:genre=)
    @genres.add_genre(album, 'pop')
    expect(@genres.genreslist.length).to eql 2
  end
end
