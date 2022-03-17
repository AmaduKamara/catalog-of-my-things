require 'date'
require './classes/book'
require './classes/label'

class HandleBooks
  def initialize
    @books = load_books
    @labels = load_labels
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

  # Load & Save labels to JSON
  def load_labels
    if File.exist?('./json_data_files/label.json') && File.read('./json_data_files/label.json') != ''
      JSON.parse(File.read('./json_data_files/label.json')).map do |label|
        Label.new(title: label['title'], color: label['color'])
      end
    else
      []
    end
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ title: label.title, color: label.color })
    end
    open('./json_data_files/label.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end

  # Load & Save Books to JSON
  def load_books
    if File.exist?('./json_data_files/book.json') && File.read('./json_data_files/book.json') != ''
      JSON.parse(File.read('./json_data_files/book.json')).map do |book|
        Book.new(publisher: book['publisher'], cover_state: book['cover_state'], publish_date: book['publish_date'])
      end
    else
      []
    end
  end

  def save_books
    data = []
    @books.each do |book|
      data.push({ publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date })
    end
    open('./json_data_files/book.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end
end
