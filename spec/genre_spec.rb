require_relative '../lib/genre'

describe Genre do
  context 'While testing Genre class' do
    before :each do
      @genre = Genre.new('Thriller')
      @new_book = Book.new('The Bible', 'Milenias', 2022, 'good')
    end

    it 'should return intance of Genre' do
      expect(@genre).to be_instance_of(Genre)
    end

    it 'should return correct name' do
      expect(@genre.name).to eq('Thriller')
    end

    it 'should allow Item add itself to genre items' do
      @new_book.add_genre(@genre)
      puts @genre.items
      expect(@genre.items).not_to be_empty
    end
  end
end
