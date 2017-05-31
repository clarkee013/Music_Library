require ('pg')
require_relative ('../db/sql_runner')

class Artist 

  attr_reader :id, :name

  def initialize ( options )
    @id = options['id'].to_i
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO artist (name) VALUES ('#{@name}') RETURNING *;"
    SqlRunner.run(sql)
    @id = SqlRunner.run(sql)[0]['id'].to_i
  end

  def self.all
    sql = "SELECT * FROM artist;"
    artist = SqlRunner.run(sql)
    return artist.map { |name| Artist.new(name)}
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id};"
    results = SqlRunner.run(sql)
    album_list = results.map {|album_hash| Album.new(album_hash)}
    return album_list
  end

  def self.delete_all()
    sql = "DELETE FROM artist;"
    SqlRunner.run(sql)
  end

  def self.list_artist_albums()
    sql = "SELECT * FROM artist WHERE album = #{@title};"
    result = SqlRunner.run(sql)
    return result
  end

  def self.delete_single_artist()
    sql = "DELETE from artist WHERE artist = #{@name}"
  end






end # END of CLASS