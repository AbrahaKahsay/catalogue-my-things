require_relative '../lib/book'

describe Book do
  before :each do
    @new_book = Book.new('The Bible', 'Milenias', '22/04/2013', 'good')
  end
  context 'Create a new Book' do
    it 'Should be an instance of Book class' do
      expect(@new_book).to be_an_instance_of(Book)
    end

    it 'Should has the title: The bible' do
      expect(@new_book.title).to eql('The Bible')
    end

    it 'Should has publisher property: Milenias' do
      expect(@new_book.publisher).to match('Milenias')
    end
  end
end
