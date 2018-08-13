class Song 
  attr_accessor :name 
  attr_accessor :artist 
  @@all = []
  def initialize(name)
    @name = name
  end
  
  # def name=(name)
  #   @name = name
  # end
  
  def self.new_by_filename(filename)
    artistName, songName = filename.split(" - ")
    song = self.new(songName)
    song.artist_name = artistName
    song
  end
  
  def artist_name=(name)
    artist = Artist.find_or_create_by_name(name)
    self.artist = artist
    artist.add_song(self)
  end
end