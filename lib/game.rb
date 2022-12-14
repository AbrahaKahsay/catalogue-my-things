require_relative './item'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :archived

  def initialize(publish_date, multiplayer, last_played_at)
    super(publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  private

  def can_be_archived?
    current_year = Time.new.year
    super && current_year - @last_played_at >= 2
  end
end
