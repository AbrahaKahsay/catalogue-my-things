require_relative './lib/game'
class App
  def initialize
    @authors = []
    @games = []
  end

  def add_game
    print 'introduce publish date: '
    publish_date = gets.chomp
    print 'Is a multiplayer game?: '
    multiplayer = case gets.chomp
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
      print "publish date: #{game.publish_date}"
      print " multiplayer: #{game.multiplayer ? 'Yes' : 'No'} "
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
end
