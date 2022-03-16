require 'date'
require './classes/book'
require './classes/label'

class HandleBooks
  def initialize
    @books = []
    @labels = []
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

    book = Book.new(publisher: publisher, cover_state: cover_state, publish_date: publish_date)
    label = Label.new(title: title, color: color)
    @books.push(book)
    @labels.push(label)
    puts 'Book and Label created successfully'
  end

  def display_books
    @books.each do |book|
      puts "Publisher: #{book.publisher}"
      puts "Cover State: #{book.cover_state}"
      puts "Publish Date: #{book.publish_date}"
    end
  end

  def display_labels
    @labels.each do |label|
      puts "Title: #{label.title}"
      puts "Color: #{label.color}"
    end
  end
end
