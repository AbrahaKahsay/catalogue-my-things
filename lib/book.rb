require_relative './item'

class Book < Item
  def initialize(title, publisher, publish_date, cover_state)
    super(publish_date)
    @title = title
    @publisher = publisher
    @cover_state = cover_state
  end

  attr_accessor :publisher, :cover_state, :title

  private

  def can_be_archived?
    true if super || @cover_state == 'bad'
  end
end
