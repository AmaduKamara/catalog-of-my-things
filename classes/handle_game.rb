require 'json'
require 'date'
require_relative 'game'
require_relative 'author'

class HandleGame
  def initialize
    @games = load_games
    @authors = load_authors
  end

  # Create Game & Author
  def create_game
    print 'Is the game a multiplayer? [Y/N]: '
    multiplayer = gets.chomp.downcase == 'y' || false

    print 'Publish date of the game [Enter date in format (yyyy-mm-dd)]: '
    publish_date = Date.parse(gets.chomp)
    return unless publish_date

    print 'When was the game last played? [Enter date in format (yyyy-mm-dd)]:'
    last_played_at = Date.parse(gets.chomp)
    return unless last_played_at

    @games << Game.new(multiplayer: multiplayer, last_played_at: last_played_at, publish_date: publish_date)
    puts 'Game created successfully'

    print 'Do you want to add author? [Y/N]: '
    perm = gets.chomp.downcase == 'y' || false
    if perm
      add_author
    else
      puts 'Game created successfully'
    end
  end

  def add_author
    puts 'Please, type the author first name '
    first_name = gets.chomp
    puts 'Please, type the author last name '
    last_name = gets.chomp
    @authors << Author.new(first_name: first_name, last_name: last_name)
    puts 'Game and Author created successfully'
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

  # Load & Save Games to JSON
  def load_games
    if File.exist?('./json_data_files/games.json') && File.read('./json_data_files/games.json') != ''
      JSON.parse(File.read('./json_data_files/games.json')).map do |game|
        Game.new(multiplayer: game['multiplayer'], last_played_at: game['last_played_at'],
                 publish_date: game['publish_date'])
      end
    else
      []
    end
  end

  def save_games
    data = []
    @games.each do |game|
      data.push(multiplayer: game.multiplayer, publish_date: game.publish_date, last_played_at: game.last_played_at)
    end
    open('./json_data_files/games.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end

  # Load & Save Albums to JSON
  def load_authors
    if File.exist?('./json_data_files/author.json') && File.read('./json_data_files/author.json') != ''
      JSON.parse(File.read('./json_data_files/author.json')).map do |author|
        Author.new(first_name: author['first_name'], last_name: author['last_name'])
      end
    else
      []
    end
  end

  def save_authors
    data = []
    @authors.each do |author|
      data.push(first_name: author.first_name, last_name: author.last_name)
    end
    open('./json_data_files/author.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end
end
