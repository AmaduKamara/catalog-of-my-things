require './classes/handle_book'
require './classes/handle_musicalbum'
require './classes/handle_game'
require 'colorize'

class App
  def initialize
    @handle_book = HandleBooks.new
    @handle_musicalbum = HandleMusicAlbum.new
    @handle_game = HandleGame.new
  end

  def menu
    puts 'Please choose an option by entering a number:'.white.on_green.bold
    puts "
           1 - List all books
           2 - List all music albums
           3 - List all games
           4 - List all genres
           5 - List all labels
           6 - List all authors ".green
    puts "           7 - Add a book
           8 - Add a music album
           9 - Add a game ".magenta
    puts '           10 - Exit'.red.bold
  end

  def choose_options(user_input)
    case user_input
    when 1..6
      list_options(user_input)
    when 7
      @handle_book.create_book
    when 8
      @handle_musicalbum.create_music_album
    when 9
      @handle_game.create_game
    end
  end

  def list_options(option)
    case option
    when 1
      @handle_book.display_books
    when 2
      @handle_musicalbum.list_albums
    when 3
      @handle_game.list_games
    when 4
      @handle_musicalbum.list_genres
    when 5
      @handle_book.display_labels
    when 6
      @handle_game.list_authors
    end
  end

  def save_data
    @handle_musicalbum.save_genres
    @handle_musicalbum.save_albums
    @handle_game.save_games
    @handle_game.save_authors
    @handle_book.save_labels
    @handle_book.save_books
  end
end
