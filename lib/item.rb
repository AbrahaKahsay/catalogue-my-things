require_relative './author'
require_relative './label'
require_relative './genre'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(publish_date)
    @id = rand(0..400)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive()
    @archived = can_be_archived?
  end

  def add_genre(genre)
    @genre = Genre.new(genre)
    genre.items.push(self)
  end

  def add_author(author_name, author_lastname)
    @author = Author.new(author_name, author_lastname)
    author.items << self
  end

  def add_source(source)
    @source = source
  end

  def add_label(title, color)
    @label = Label.new(title, color)
    label.items.push(self)
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    current_year - @publish_date >= 10
  end
end
