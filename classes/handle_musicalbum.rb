require 'json'
require 'date'
require_relative 'music_album'
require_relative 'music_genre'

class HandleMusicAlbum
  def initialize
    @albums = load_albums
    @genres = load_genres
  end

  # Create Music Album & Genre
  def create_music_album
    print 'Please, type the album name: '
    name = gets.chomp

    print 'Publish date of the album [Enter date in format (yyyy-mm-dd)]: '
    publish_date = Date.parse(gets.chomp)
    return unless publish_date

    print 'Is the album on spotify? [Y/N]: '
    on_spotify = gets.chomp.downcase == 'y' || false

    @albums << MusicAlbum.new(name: name, publish_date: publish_date, on_spotify: on_spotify)
    puts 'Album created successfully'

    print 'Do you want to add genre? [Y/N]: '
    perm = gets.chomp.downcase == 'y' || false
    if perm
      puts 'Please, type the genre name '
      g_name = gets.chomp
      @genres << Genre.new(name: g_name)
      puts 'Music album and Genre created successfully'
    else
      puts 'Music Album created successfully'
    end
  end

  # List Albums and Genres
  def list_albums
    @albums.each do |album|
      puts "\nName: #{album.name}"
      puts "Publish Date: #{album.publish_date}"
      puts "On Spotify: #{album.on_spotify}"
    end
  end

  def list_genres
    @genres.each do |genre|
      puts "\nName: #{genre.name}"
    end
  end

  # Load & Save Genres to JSON
  def load_genres
    if File.exist?('./json_data_files/genre.json') && File.read('./json_data_files/genre.json') != ''
      JSON.parse(File.read('./json_data_files/genre.json')).map do |genre|
        Genre.new(name: genre['name'])
      end
    else
      []
    end
  end

  def save_genres
    data = []
    @genres.each do |genre|
      data.push({ name: genre.name })
    end
    open('./json_data_files/genre.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end

  # Load & Save Albums to JSON
  def load_albums
    if File.exist?('./json_data_files/album.json') && File.read('./json_data_files/album.json') != ''
      JSON.parse(File.read('./json_data_files/album.json')).map do |album|
        MusicAlbum.new(name: album['name'], publish_date: album['publish_date'], on_spotify: album['spotify'])
      end
    else
      []
    end
  end

  def save_albums
    data = []
    @albums.each do |album|
      data.push({ name: album.name, publish_date: album.publish_date, spotify: album.on_spotify })
    end
    open('./json_data_files/album.json', 'w') { |f| f << JSON.pretty_generate(data) }
  end
end
