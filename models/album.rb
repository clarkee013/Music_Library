require ('pg')
require_relative ('../db/sql_runner')

class Album

  attr_reader :id, :title, :artist_id, :genre

  def initialize ( options )
    @id = options['id'].to_i
    @title = options['title']
    @artist_id = options['artist_id']
    @genre = options['genre']
  end


  def save()
    sql = "INSERT INTO album (title, genre) VALUES ('#{@title}', '#{@genre}') RETURNING *;"
    result = SqlRunner.run(sql)
    @id = result[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM album;"
    album = SqlRunner.run(sql)
    return album.map { |cd| Album.new(cd)}
  end




end # END of CLASS