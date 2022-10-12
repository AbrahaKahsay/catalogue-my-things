require_relative '../lib/book'

describe Book do
  before :each do
    @new_book = Book.new('The Bible', 'Milenias', 2022, 'good')
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

  # context 'Testing Genre and Author properties' do
  #  it 'Should add Genre properties to the book' do

  # end
  # end

  context 'Testing the can_be_archived method of the Book Class' do
    it 'Should return false if the cover state is good' do
      expect(@new_book.can_be_archived?).to be false
    end

    it 'Should return true if the publish date is greater than 10 years ago' do
      @new_book.publish_date = 2000
      expect(@new_book.can_be_archived?).to be true
    end

    it 'Should return true if the cover state is bad' do
      @new_book.cover_state = 'bad'
      expect(@new_book.can_be_archived?).to be true
    end
  end
end
