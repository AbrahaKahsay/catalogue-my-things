class Item
  attr_accessor :genre, :author, :source, :label, :publish_date, :archived
  attr_reader :id

  def initialize(genre, author, source, label, publish_date)
    @id = rand(0..400)
    @genre = genre
    @author = author
    @source = source
    @label = label
    @publish_date = publish_date
    @archived = false
  end

  def move_to_archive()
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    true if current_year - @publish_date >= 10
  end
end
