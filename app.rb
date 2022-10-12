require_relative './lib/game'
require_relative './lib/book'
require_relative './lib/author'
require_relative './manipulate_data'
class App
  include PreserveData
  include GetData
  def initialize
    @authors = []
    @games = []
    @books = []
    @labels = []
  end

  def add_book
    print 'Title: '
    title = gets.chomp.capitalize
    print 'Author First Name: '
    author_input_first_name = gets.chomp.capitalize
    print 'Author Last Name: '
    author_input_last_name = gets.chomp.capitalize
    print 'Is the cover in good state? [Y/N]: '
    cover_state = case gets.chomp.downcase
                  when 'y'
                    'good'
                  else
                    'bad'
                  end
    print 'What is the publisher of the book?: '
    publisher = gets.chop.capitalize
    print 'What is the YEAR when the book was published?: '
    publish_date = gets.chomp.to_i
    print 'What is the Label Name?: '
    label_name = gets.chomp.capitalize
    print 'What is the Label Color?: '
    label_color = gets.chomp.capitalize

    book_created = Book.new(title, publisher, publish_date, cover_state)
    book_created.add_author(author_input_first_name, author_input_last_name)
    book_created.add_label(label_name, label_color)

    @books.push(book_created)
    @labels.push(book_created.label)
    @authors.push(book_created.author)

    puts 'Your Book was created and added succesfully!!!'
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

  def list_all_books
    puts 'List of all the Books Saved:'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: #{book.title}, Author: #{book.author.first_name} #{book.author.last_name},
      Publish Date: #{book.publish_date}"
    end
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

  def list_all_labels
    if @labels.length.positive?
      puts 'These are all your Labels: '
      @labels.each_with_index do |label, index|
        puts "#{index}) #{label.title}, #{label.color}, Belongs to: #{label.items[0].class} #{label.items[0].title}"
      end
    else
      puts 'There are no Labels, please add some'
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
