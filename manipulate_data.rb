require 'json'

module PreserveData
  def preserve_games
    games_data = []
    @games.each do |game|
      games_data.push(
        {
          multiplayer: game.multiplayer,
          last_played_at: game.last_played_at,
          publish_date: game.publish_date,
          archived: game.archived,
          genre: game.genre || nil,
          author: game.author || nil,
          label: game.label || nil,
          source: game.source || nil
        }
      )
      File.write('./data/games.json', JSON.generate(games_data))
    end
  end

  def preserve_authors
    authors_data = []
    @authors.each do |author|
      authors_data.push(
        {
          first_name: author.first_name,
          last_name: author.last_name
        }
      )
      File.write('./data/authors.json', JSON.generate(authors_data))
    end
  end

  def preserve_music_albums
    music_albums_data = []
    @music_albums.each do |music_album|
      music_albums_data.push(
        {
          name: music_album.name,
          publish_date: music_album.publish_date,
          # genre: music_album.genre || nil,
          on_spotify: music_album.on_spotify
        }
      )
      File.write('./data/music_albums.json', JSON.generate(music_albums_data))
    end
  end

  def preserve_geners
    genres_data = []
    @genres.each do |genre|
      genres_data.push(
        {
          name: genre.name
        }
      )
      File.write('./data/genres.json', JSON.generate(genres_data))
    end
  end

  def preserve_books
    books_data = []
    @books.each do |book|
      books_data.push(
        {
          title: book.title,
          publisher: book.publisher,
          cover_state: book.cover_state,
          publish_date: book.publish_date,
          archived: book.archived
        }
      )
      File.write('./data/books.json', JSON.generate(books_data))
    end
  end

  def preserve_labels
    labels_data = []
    @labels.each do |label|
      labels_data.push(
        {
          title: label.title,
          color: label.color
        }
      )
      File.write('./data/labels.json', JSON.generate(labels_data))
    end
  end
end

module GetData
  def fetch_games
    return unless File.exist?('./data/games.json')

    JSON.parse(File.read('./data/games.json')).each do |game|
      @games << Game.new(game['publish_date'], game['multiplayer'] ? 'yes' : false, game['last_played_at'])
    end
  end

  def fetch_books
    return unless File.exist?('./data/books.json')

    JSON.parse(File.read('./data/books.json')).each do |book|
      @books << Book.new(book['title'], book['publisher'],
                         book['publish_date'], book['cover_state'])
    end
  end

  def fetch_authors
    return unless File.exist?('./data/authors.json')

    JSON.parse(File.read('./data/authors.json')).each do |author|
      @authors << Author.new(author['first_name'], author['last_name'])
    end
  end

  def fetch_music_albums
    return unless File.exist?('./data/music_albums.json') && File.empty?('./data/music_albums.json')
    JSON.parse(File.read('./data/music_albums.json')).each do |music_album|
      @music_albums << MusicAlbum.new(music_album['name'],
                                      music_album['publish_date'],
                                      music_album['on_spotify'] ? true : false)
    end
  end

  def fetch_genres
    return unless File.exist?('./data/genres.json')

    JSON.parse(File.read('./data/genres.json')).each do |genre|
      @genres << Genre.new(genre['name'])
  def fetch_labels
    return unless File.exist?('./data/labels.json')

    JSON.parse(File.read('./data/labels.json')).each do |label|
      @labels << Label.new(label['title'], label['color'])
    end
  end
end
