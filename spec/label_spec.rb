require './classes/label'
require './classes/item'
require 'date'

describe Label do
  context 'It should create a Label' do
    newitem = Item.new(id: nil, publish_date: Date.parse('1999/10/26'))
    label = Label.new(id: 1, title: 'Gift', color: 'Red')
    it 'should create a new label' do
      expect(label.title).to eq 'Gift'
    end
    it 'should an instance of Label' do
      expect(label).to be_an_instance_of Label
    end
    it 'should have color' do
      expect(label.color).to eq 'Red'
    end
    it 'should add a new item' do
      label.add_item(newitem)
      expect(label.items.length).to eq 1
    end
  end
end
