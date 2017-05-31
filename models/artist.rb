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
    results = SqlRunner.run(sql)
    list_results = results.map { |nom| Album.new(nom)}
    return list_results
  end

  def self.delete_single_artist()
    sql = "DELETE from artist WHERE artist = #{@name};"
    SqlRunner.run(sql)
  end

  def amend_artist_details()
    sql = "UPDATE artist SET name = #{@name};"
    SqlRunner.run(sql)
  end

  def delete_by_name()
    sql = "DELETE FROM artist WHERE name = #{@name};"
     SqlRunner.run(sql)
  end

  def delete_by_id()
    sql = "DELETE FROM artist WHERE id = #{@id};"
    SqlRunner.run(sql)
  end


end # END of CLASS