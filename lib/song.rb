# class Song
#   attr_accessor :name, :artist, :genre
#   @@all = [] 
  
#   def initialize(name, artist = nil, genre = nil)
#     @name = name
#     self.artist=(artist) if artist != nil
#     self.genre=(genre) if genre != nil 
#     save 
#   end
  
#   def save 
#     @@all << self 
#   end
  
#   def artist 
#     @artist 
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
  
#   def genre 
#     @genre 
#   end
  
#   def genre=(genre)
#     @genre = genre
#     genre.songs << self unless genre.songs.include?(self)
#   end
  
#   def self.create(song)
#     song = self.new(song)
#     song.save
#     song
#   end
  
#   def artist=(artist)
#     @artist = artist
#     artist.add_song(self)
#   end
  
#   def self.find_by_name(name)
#     @@all.detect do |song| 
#     song.name == name
#     end 
#   end
  
#   def self.find_or_create_by_name(name)
#     @@all.detect do |song|
#       if song.name == name
#         song
#       else
#         self.create(name)
#       end
#     end
#     self.find_by_name(name) || self.create(name)
#   end

#   def self.new_from_filename(filename)
#     array = filename.split(" - ")

#     song_name = array[1]
#     artist_name = array[0]
#     genre_name = array[2].split(".mp3").join

#     artist = Artist.find_or_create_by_name(artist_name)
#     genre = Genre.find_or_create_by_name(genre_name)
#     self.new(song_name, artist, genre)
#   end

#   def self.create_from_filename(filename)
#     self.new_from_filename(filename).save
#   end
# end 
# class Song

#   #extend Concerns::Findable

#   attr_accessor :name

#   @@all = [] 

#   def initialize(name,artist=nil,genre=nil)
#     @name = name
#     self.artist = artist if artist
#     self.genre = genre if genre
#   end

#   def self.all
#     @@all
#   end

#   def self.destroy_all
#     self.all.clear
#   end

#   def save
#     @@all << self
#   end

#   def self.create(name)
#     self.new(name).tap do|song|
#       song.save
#     end
#   end

#   def artist=(artist)
#     if @artist == nil
#       @artist = artist
#     else
#       @artist = @artist
#     end
#     if self.artist != nil
#       @artist.add_song(self)
#     end
#     @artist
#   end

#   def artist
#     @artist
#   end

#   def genre=(genre)
#     if @genre == nil
#       @genre = genre
#     else
#       @genre= @genre
#     end
#     if self.genre != nil
#       @genre.add_song(self)
#     end
#     @genre

#   end

#   def genre
#     @genre
#   end

#   def self.find_by_name(name)
#     @@all.find do |song|
#         song.name == name
#     end
#   end

#   def self.find_or_create_by_name(name)
#     self.find_by_name(name) || self.create(name)
#   end

#   def self.create_from_filename(name)
#     @@all << self.new_from_filename(name)

#   end

#   def self.new_from_filename(name)
#     song_name = name.split(" - ")[1]
#     artist_name = name.split(" - ")[0]
#     genre_name = name.split(" - ")[2].chomp(".mp3")
#     song = self.find_or_create_by_name(song_name)
#     song.artist = Artist.find_or_create_by_name(artist_name)
#     song.genre = Genre.find_or_create_by_name(genre_name)
#     song
#   end


# end

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(name, artist = nil, genre = nil)
    @name = name
    self.artist=artist if artist
    # self.artist.songs.push(self)
    self.genre=genre if genre
    # @artist = artist
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
    song = self.new(name)
    song.save
    song
  end

  def artist=(artist)
    @artist = artist
    artist.add_song(self)
    # Artist.all.push(artist)
  end

  def genre=(genre)
    @genre = genre
    if !(genre.songs.include?(self))
      genre.songs << self
      # Genre.all.push(genre)
    # binding.pry
    end
  end

  def self.find_by_name(name)
    all.detect {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end
    find_by_name(name) || create(name)
  end

  def self.new_from_filename(filename)
    info = filename.split(" - ")
    artist, name, genre = info[0], info[1], info[2].gsub( ".mp3" , "")

    # song = self.find_or_create_by_name(name)
    genre = Genre.find_or_create_by_name(genre)
    artist = Artist.find_or_create_by_name(artist)

    new(name,artist,genre)
  end

  def self.create_from_filename(filename)
    new_from_filename(filename).tap{ |s| s.save}

  end
end

# require_relative './config/environment'



# Song.new("Sexy Sadie")
# song = Song.new("Sexy Sadie")
# song = Song.create("Sexy Sadie")
# pop = Genre.new("Pop")
# ruby ../lib/song.rb
# song.genre = pop




