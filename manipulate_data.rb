require 'json'
module PreserveData
  def preserve_games
    games_data = []
    @games.each do | game |
      games_data.push(
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
      File.write('./data/books.json',JSON.generate(games_data))
    end
  end

  def preserve_authors
    authors_data = []
    @authors.each do | author |
      authors_data.push(
        {
          first_name: author.first_name,
          last_name: author.last_name,
        }
      )
      File.write('./data/authors.json',JSON.generate(authors_data))
    end
  end
end

module GetData
  def get_games
    if File.exists?('./data/books.json')
      JSON.parse(File.read('./data/books.json')).each do |game|
        @games << Game.new(game["publish_date"],game["multiplayer"],game["last_played_at"])
      end
    end
  end

  def get_authors
    if File.exists?('./data/authors.json')
      JSON.parse(File.read('./data/authors.json')).each do |author|
        @authors << Author.new(author["first_name"],author["last_name"])
      end
    end
  end
end