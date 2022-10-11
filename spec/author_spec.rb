require_relative '../author'
describe Author do
  context 'test class' do
    before(:each) do
      @author = Author.new('Gonzalo', 'Macabeo')
      @item = Item.new(2020)
    end
    it 'test author being a intance of Author class ' do
      expect(@author).to be_instance_of(Author)
    end

    it 'test author method add_item' do
      @author.add_item(@item)
      expect(@author.items.length).to be(1)
    end
  end
end
