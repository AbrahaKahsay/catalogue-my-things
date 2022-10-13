require_relative './lib/game'
require_relative './manipulate_data'
class App
  include PreserveData
  include GetData
  def initialize
    @authors = []
    @games = []
    @genres = []
    @music_albums = []
  end

  # Add a music album
  def add_music_album
    print 'What is the name of the album?: '
    name = gets.chomp
    print 'introduce publish date: '
    publish_date = gets.chomp
    print 'Is the music album on spotify? [yes/no]: '
    on_spotify = case gets.chomp.downcase
                  when 'yes'
                    true
                  else
                    false
                  end
    
    @music_albums << MusicAlbum.new(publish_date, multiplayer, last_time_played)
    puts 'a game has been created'
  end

  def add_game
    print 'introduce publish date: '
    publish_date = gets.chomp
    print 'Is a multiplayer game? [yes/no]: '
    multiplayer = case gets.chomp.downcase
                  when 'yes'
                    true
                  else
                    false
                  end
    print 'When was the last time you played it?: '
    last_time_played = gets.chomp
    @games << Game.new(publish_date, multiplayer, last_time_played)
    puts 'a game has been created'
  end

  def list_all_games
    puts 'Games: '
    @games.each_with_index do |game, index|
      print "#{index + 1}) ~ "
      print "publish date: #{game.publish_date} ~ "
      print " multiplayer: #{game.multiplayer ? 'Yes' : 'No'} ~ "
      print "Last time played at: #{game.last_played_at} \n"
    end
  end

  def list_all_authors
    if @authors.length.positive?
      puts 'Authors: '
      @authors.each_with_index do |author, index|
        print "#{index + 1}) ~ "
        print "Name: #{author.first_name} #{author.last_name} \n"
      end
    else
      puts "There's no author avalaible"
    end
  end

  def preserve_data
    preserve_games
    preserve_authors
  end

  def fetch_data
    fetch_games
    fetch_authors
  end
end
