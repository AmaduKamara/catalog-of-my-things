require 'json'
require 'date'
require_relative 'game'
require_relative 'author'

class HandleGame
  def initialize
    @games = []
    @authors = []
  end

  # Create Game & Author
  def create_game
    print 'Is the game a multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y' || false

    print 'Publish date of the game [Enter date in format (yyyy-mm-dd)]: '
    publish_date = Date.parse(gets.chomp)
    return unless publish_date

    print 'When was the game last played? '
    last_played_at = Date.parse(gets.chomp)
    return unless last_played_at

    @games << Game.new(multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date)
    puts 'Game created successfully'

    print 'Do you want to add author? [Y/N]: '
    perm = gets.chomp.downcase == 'y' || false
    if perm
      puts 'Please, type the author first name '
      first_name = gets.chomp
      puts 'Please, type the author last name '
      last_name = gets.chomp
      @authors << Author.new(first_name: first_name, last_name: last_name)
      puts 'Game and Author created successfully'
    else
      puts 'Game created successfully'
    end
  end

  # List Games and Authors
  def list_games
    @games.each do |game|
      puts "\nMultiplayer: #{game.multiplayer}"
      puts "Publish Date: #{game.publish_date}"
      puts "Last played at: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each do |author|
      puts "\nFirst name: #{author.first_name}"
      puts "Last name: #{author.last_name}"
    end
  end

  # # Load & Save Genres to JSON
  # def load_genres
  #   if File.exist?('./json_data_files/genre.json') && File.read('./json_data_files/genre.json') != ''
  #     JSON.parse(File.read('./json_data_files/genre.json')).map do |genre|
  #       Genre.new(name: genre['name'])
  #     end
  #   else
  #     []
  #   end
  # end

  # def save_genres
  #   data = []
  #   @genres.each do |genre|
  #     data.push({ name: genre.name })
  #   end
  #   open('./json_data_files/genre.json', 'w') { |f| f << JSON.pretty_generate(data) }
  # end

  # # Load & Save Albums to JSON
  # def load_albums
  #   if File.exist?('./json_data_files/album.json') && File.read('./json_data_files/album.json') != ''
  #     JSON.parse(File.read('./json_data_files/album.json')).map do |album|
  #       MusicAlbum.new(name: album['name'], publish_date: album['publish_date'], on_spotify: album['spotify'])
  #     end
  #   else
  #     []
  #   end
  # end

  # def save_albums
  #   data = []
  #   @albums.each do |album|
  #     data.push({ name: album.name, publish_date: album.publish_date, spotify: album.on_spotify })
  #   end
  #   open('./json_data_files/album.json', 'w') { |f| f << JSON.pretty_generate(data) }
  # end
end
