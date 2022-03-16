require 'date'
require './classes/book'

class HandleBooks
  def initialize
    @books = []
  end

  def create_book
    print 'publisher: '
    publisher = gets.chomp

    print 'Cover State: '
    cover_state = gets.chomp

    print 'Publish Date yy-mm-dd: '
    publish_date = Date.parse(gets.chomp)

    book = Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    @books.push(book)
    puts 'Book created successfully'
  end

  def display_books
    @books.each do |book|
      puts "Title: #{book.publisher}"
      puts "Author: #{book.cover_state}"
      puts "Publish Date: #{book.publish_date}"
    end
  end
end
