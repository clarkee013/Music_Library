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

  def self.list_albums_by_artist
    sql = "SELECT FROM album WHERE artist = #{@artist};"
    results = SqlRunner.run(sql)
    list_results = results.map { |cds| Album.new(cds)}
    return list_results
  end

  def self.delete_all()
    sql = "DELETE FROM album;"
    SqlRunner.run(sql)
  end

  def amend_album_details()
    sql = "UPDATE album (title, genre) VALUES ('#{@title}', '#{@genre}';"
    SqlRunner.run(sql)
  end

  def delete_by_title()
    sql = "DELETE FROM album WHERE name = #{@title}"
     SqlRunner.run(sql)
   end 

   def delete_by_id()
     sql = "DELETE FROM album WHERE id = #{@id};"
     SqlRunner.run(sql)
   end


end # END of CLASS