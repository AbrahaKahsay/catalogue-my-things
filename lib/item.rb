class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(_genre, _author, _source, _label, publish_date)
    @id = rand(0..400)
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  def add_genre(genre)
    @genre = genre
  end

  def add_author(author)
    @author = author
  end

  def add_source(source)
    @source = source
  end

  def add_label(label)
    @label = label
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    true if current_year - @publish_date >= 10
  end
end
