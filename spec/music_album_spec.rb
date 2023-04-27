require_relative '../modules/music_album'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new('Rock on', '2022-02-13', false)
  end
  it 'create album instance' do
    expect(@album).to be_instance_of(MusicAlbum)
  end
  it '#can_be_archived?' do
    @album = MusicAlbum.new('Rock on', '2022-02-13', false)
    expect(@album.can_be_archived?).to be_falsey
  end
end
