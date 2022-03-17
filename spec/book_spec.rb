require './classes/book'
require 'date'

describe Book do
  context 'It should create a book' do
    book = Book.new(publisher: 'MyPublisher', cover_state: 'New', publish_date: Date.parse('1999/10/26'))
    it 'should create a new book' do
      expect(book.publisher).to eq 'MyPublisher'
    end
    it 'should an instance of Book' do
      expect(book).to be_an_instance_of Book
    end
    it 'should have cover state' do
      expect(book.cover_state).to eq 'New'
    end
    it 'should have a publish date' do
      expect(book.publish_date).to eq Date.parse('1999/10/26')
    end
  end
end
