# rubocop:disable Metrics/CyclomaticComplexity
require_relative './app'
class Main
  def initialize
    @app = App.new
  end

  def options
    menu = [
      "\nPlease choose an option by entering a number",
      '1 - List all books',
      '2 - List all games ',
      '3 - List all music albums',
      '4 - List all genres',
      '5 - List all labels',
      '6 - List all authors',
      '7 - Add a book',
      '8 - Add a game',
      '9 - Add a music album',
      "10 - Exit \n"
    ]
    puts menu
  end

  def input_cases(input)
    case input
    when 1
      puts 'pending list of books'
    when 2
      @app.list_all_games
    when 3
      puts 'pending list of albums'
    when 4
      puts 'pending list of genres'
    when 5
      puts 'pending list of labels'
    when 6
      puts 'pending list of authors'
    when 7
      puts 'pending add book'
    when 8
      @app.add_game
    when 9
      puts 'pending add music album'
    end
  end

  def run
    puts "\nWELCOME TO My CATALOGUE OF THINGS \n"
    options
    input = gets.chomp.to_i
    while input != 10
      input_cases(input)
      options
      input = gets.chomp.to_i
    end
  end
end

Main.new.run
# rubocop:enable Metrics/CyclomaticComplexity
