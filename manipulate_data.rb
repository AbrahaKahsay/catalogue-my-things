require 'json'
module PreserveData
  def preserve_games
    books_data = []
    @games.each do | game |
      books_data.push(
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          publish_date: game.publish_date,
          archived: game.archived,
          genre: game.genre ? game.genre : nil,
          author: game.author ? game.author : nil,
          label: game.label ? game.label : nil,
          source: game.source ? game.source : nil,
        }
      )
      File.write('./data/books.json',JSON.generate(books_data))
    end
  end
end

module GetData
  def get_games
    if File.exists?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |game|
        game1 = Game.new(game["publish_date"],game["multiplayer"],game["last_played_at"])
        # author1 = Author.new(game.author.first_name,game.author.last_name)
        @games << game1
        # @authors << author1
        # author1.add_item(game1)
      end
    end
  end
end