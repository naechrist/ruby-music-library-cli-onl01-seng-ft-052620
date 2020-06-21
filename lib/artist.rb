# class Artist 
#   attr_accessor :name, :songs
#   @@all = [] 
  
#   def initialize(name)
#     @name = name
#     @songs = []
#     save 
#   end
  
#   def songs
#     @songs
#   end
  
#   def add_song(song)
#     if song.artist == nil 
#     song.artist = self 
#     end
#       if @songs.include?(song)
#         nil 
#       else
#       @songs << song
#       end
#   end
  
#   def save 
#     @@all << self 
#   end
  
#   def self.all 
#     @@all 
#   end
  
#   def self.destroy_all 
#     @@all.clear 
#   end
  
#   def self.count 
#     @@all.size 
#   end
  
#     def self.create(artist)
#     artist = self.new(artist)
#     artist.save
#     artist
#   end
  
#   def genres
#     @new_array = []
#     @songs.each do |song|
#       if @new_array.include?(song.genre)
#         nil
#       else
#         @new_array << song.genre
#       end
#     end
#     @new_array
#   end
  
# end
class Artist

  #extend Concerns::Findable

  attr_accessor :name
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end

  def songs
    @songs
  end

 #this sets up the song belongs to the artist association
  def add_song(song)
    song.artist = self unless song.artist == self
    @songs << song unless @songs.include?(song)
  end

  #artist has many genres through songs
  def genres
    genres = @songs.collect do |song|
      song.genre
    end
    genres.uniq
  end



end