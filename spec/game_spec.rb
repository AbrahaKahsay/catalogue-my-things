require_relative '../game'
describe Game do
  context 'test class' do
    before(:each) do
      @game = Game.new(2002, true, 2020)
      @game.add_author('Gonzalo', 'Macabeo')
    end
    it 'test game1 being a intance of Game class ' do
      expect(@game).to be_instance_of(Game)
    end

    it 'test game1 method move_to_archive' do
      expect(@game).to respond_to(:move_to_archive)
    end

    it 'test game1 method move_to_archive to be true' do
      expect(@game.move_to_archive).to be true
    end

    it 'test game1 method move_to_archive to be false' do
      @game.last_played_at = 2022
      expect(@game.move_to_archive).to be false
    end

    it 'test game1 method add_genre' do
      expect(@game.author).to be_instance_of(Author)
    end

    it 'test game1 method move_to_archive to be false' do
      expect(@game.author.last_name).to eq('Macabeo')
    end
  end
end
