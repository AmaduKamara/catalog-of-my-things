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

    print 'title: '
    title = gets.chomp

    print 'color: '
    color = gets.chomp

    book = Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date, title: title, color: color)
    @books.push(book)
    puts 'Book created successfully'
  end

  def display_books
    @books.each do |book|
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Publish Date: #{book.publish_date}"
    end
  end

  def display_labels
    @books.each do |book|
      puts "Title: #{book.title}"
      puts "Color: #{book.color}"
    end
  end
end
