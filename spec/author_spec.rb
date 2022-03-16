require './classes/author'
require './classes/item'
require 'date'

describe Author do
  context 'It should create an author' do
    new_author = Author.new(first_name: 'Amadu', last_name: 'Kamara', id: 4)
    item = Item.new(id: 2, publish_date: Date.parse('2020/10/26'), archived: false)
    it 'should author\'s first name' do
      expect(new_author.first_name).to eq('Amadu')
    end
    it 'should author\'s last name' do
      expect(new_author.last_name).to eq('Kamara')
    end
    it 'should create an instance of author' do
      expect(new_author).to be_an_instance_of Author
    end
    it 'should add an item' do
      new_author.add_item(item)
      expect(new_author.items.length).to eq 1
    end
  end
end
