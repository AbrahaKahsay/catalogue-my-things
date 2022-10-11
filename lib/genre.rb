class Genre
  attr_accessor :items

  def initialize(name)
    @id = rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end
end
