require './classes/handle_book'

@handle_book = HandleBooks.new

def menu
  puts 'Please choose an option by entering a number: '
  puts '1 - List all books'
  puts '2 - List all music albums'
  puts '3 - List of games'
  puts '4 - List all genres'
  puts '5 - List all labels'
  puts '6 - List all authors'
  puts '7 - Add a book'
  puts '8 - Add a music album'
  puts '9 - Add a game'
  puts '10 - Exit'
end

# rubocop:disable Metrics/CyclomaticComplexity
def choose_options(user_input)
  case user_input
  when 1
    @handle_book.display_books
  when 2
    display_music albums
  when 3
    display_games
  when 4
    display_genres
  when 5
    @handle_book.display_labels
  when 6
    display_authors
  when 7
    @handle_book.create_book
  when 8
    create_musicAlbum
  when 9
    create game
  end
end

# rubocop:enable Metrics/CyclomaticComplexity
def main()
  puts 'Welcome to our App'
  is_working = true
  while is_working == true
    menu
    user_input = gets.chomp.to_i
    is_working = false if user_input == 10
    choose_options(user_input)
  end
end

main
