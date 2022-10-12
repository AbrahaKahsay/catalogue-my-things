require_relative '../lib/label'
require_relative '../lib/book'

describe Label do
  before :each do
    @new_label = Label.new('Head', 'red')
  end
  context 'Creating an instance of label class' do
    it 'Should be an instance of label class' do
      expect(@new_label).to be_an_instance_of(Label)
    end
  end

  context 'Testing the properties of the new instance' do
    it 'Should have the title: Head' do
      expect(@new_label.title).to eql('Head')
    end
    it 'Should have the color: red' do
      expect(@new_label.color).to eql('red')
    end
  end

  context 'Testing the method add_items' do
    it 'Should add the item to the items array' do
      book_test = Book.new('lord of the rings', 'Mouse Records', 2012, 'bad')
      @new_label.add_item(book_test)

      expect(@new_label.items[0]).to be_an_instance_of(Book)
      expect(@new_label.items.length).to be(1)
      expect(@new_label.items[0].title).to match('lord of the rings')
    end
  end
end
