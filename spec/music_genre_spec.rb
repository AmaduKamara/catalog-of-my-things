require './classes/music_genre'
require './classes/item'
require 'date'

describe Genre do
  context 'It should create a genre' do
    newitem = Item.new(id: nil, publish_date: Date.parse('1999/10/26'))
    genre = Genre.new(name: 'Progressive Rock')
    it 'should create a new genre' do
      expect(genre.name).to eq 'Progressive Rock'
    end
    it 'should add a new item' do
      genre.add_item(newitem)
      expect(genre.items.length).to eq 1
    end
  end
end
