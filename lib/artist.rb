require "pry"
class Artist
  attr_accessor :name 
  attr_accessor :songs
  @@all = []
  def initialize(name)
    @name = name
    @songs = []
  end
  
  def add_song(song)
    @songs << song
  end
  
  def save
      @@all << self
  end
  
  def self.find_or_create_by_name(name)
    if @@all.any?{|item| item.name == name}
      # binding.pry
      @@all.select{|item| item.name == name}.first
      # self.all.find {|artist| artist.name == name }
    else
      artist = self.new(name)
      artist.save
      artist
      # self.new(name).tap {|artist| artist.save}
    end
  end
  
  def self.all 
    @@all
  end
  
  def print_songs
    self.songs.each{|song| puts song.name}
  end
end
# artist = Artist.new("BJ")
# artist2 = Artist.new("MJ")
# artist.save
# artist2.save
# puts Artist.all.length
# artst = Artist.find_or_create_by_name("MJ")
# # puts artst.name
# puts Artist.all.length
# artst2 = Artist.find_or_create_by_name("CCJ")
# puts Artist.all.length