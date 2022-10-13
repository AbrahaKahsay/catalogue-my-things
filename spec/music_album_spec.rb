require_relative '../lib/music_album'

describe MusicAlbum do
  context 'While testing MusicAlbum class' do
    before :each do
      @new_album = MusicAlbum.new(true, 'Exodus', 1977)
    end

    it 'Should return an instance of MusicAlbum' do
      expect(@new_album).to be_an_instance_of(MusicAlbum)
    end

    it 'Should return the correct properties' do
      expect(@new_album.name).to eq('Exodus')
      expect(@new_album.publish_date).to eq(1977)
      expect(@new_album.on_spotify).to be true
    end
  end
end
