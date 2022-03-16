require './classes/handle_book'

@handle_book = HandleBooks.new

def menu
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List all movies'
  puts '4 - List of games'
  puts '5 - List all genres'
  puts '6 - List all labels'
  puts '7 - List all authors'
  puts '8 - List all sources'
  puts '9 - Add a book'
  puts '10 - Add a music album'
  puts '11 - Add a game'
  puts '12 - Exit'
end

# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
def choose_options(user_input)
  case user_input
  when 1
    @handle_book.display_books
  when 2
    display_music albums
  when 3
    display_movies
  when 4
    display_games
  when 5
    display_genres
  when 6
    @handle_book.display_labels
  when 7
    display_authors
  when 8
    display_sources
  when 9
    @handle_book.create_book
  when 10
    create_musicAlbum
  when 11
    create game
  end
end
# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Metrics/MethodLength

def main()
  puts 'Welcome to our App'
  is_working = true
  while is_working == true
    menu
    user_input = gets.chomp.to_i
    is_working = false if user_input == 12
    choose_options(user_input)
  end
end

main
