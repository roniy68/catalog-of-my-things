require_relative '../modules/music_albums'

describe MusicAlbums do
  before :all do
    @albums = MusicAlbums.new
  end
  it '#add_music_album' do
    album = @albums.add_music_album('zeit', '2022-12-12', false)
    expect(album).to be_instance_of(MusicAlbum)
    expect(@albums.albumlist.length).to eql 1
  end

  it '#add_music_album 2nd album' do
    album = @albums.add_music_album('rosenrot', '2022-12-12', true)
    expect(album).to be_instance_of(MusicAlbum)
    expect(@albums.albumlist.length).to eql 2
  end
end
