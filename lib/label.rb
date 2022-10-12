class Label
  def initialize(title, color)
    @id = rand(0..1000)
    @title = title
    @color = color
    @items = []
  end

  attr_accessor :items, :title, :color

  def add_item(item)
    @items.push(item)
    item.label = self
  end
end
