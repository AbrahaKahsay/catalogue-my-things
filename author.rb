class Author
  attr_accessor :items

  def initialize(first_name, last_name)
    @id = rand(0..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item
    item.author = self
  end
end
