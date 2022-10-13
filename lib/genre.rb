class Genre
  attr_accessor :id
  attr_reader :items, :name

  def initialize(name)
    @id = Random.rand(0..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre = self
  end
end
