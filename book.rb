require_relative './item'

class Book < Item
  def initialize(genre, author, source, label, publish_date, publisher, cover_state)
    super(genre, author, source, label, publish_date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    true if Book.can_be_archived? || @cover_state == 'bad'
  end
end
