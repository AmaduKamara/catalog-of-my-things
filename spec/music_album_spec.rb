require './classes/music_album'
require 'date'

describe MusicAlbum do
  context 'It should create a music album' do
    album = MusicAlbum.new(name: 'Metropolis', publish_date: Date.parse('1999/10/26'), on_spotify: true)
    it 'should create a new album' do
      expect(album.name).to eq 'Metropolis'
    end
    it 'should an instance of MusicAlbum' do
      expect(album).to be_an_instance_of MusicAlbum
    end
    it 'should have a publish date' do
      expect(album.publish_date).to eq Date.parse('1999/10/26')
    end
  end
end
