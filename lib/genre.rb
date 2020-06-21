# class Genre 
#   attr_accessor :name, :songs
#   @@all = [] 
  
#   def initialize(name)
#     @name = name
#     @songs = []
#     save 
#   end
  
#   def artists
#     @new_array = []
#     @songs.each do |song|
#       if @new_array.include?(song.artist)
#         nil
#       else
#         @new_array << song.artist
#       end
#     end
#     @new_array
#   end
  
#   def songs 
#     @songs 
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
  
#     def self.create(genre)
#     genre = Genre.new(genre)
#     genre.save
#     genre
#   end
  
# end

# class Genre

#   #extend Concerns::Findable

#   attr_accessor :name
#   @@all = []

#   def initialize(name)
#     @name = name
#     @songs = []
#   end

#   def self.all
#     @@all
#   end

#   def self.destroy_all
#     @@all.clear
#   end

#   def save
#     @@all << self
#   end

#   def self.create(name)
#     self.new(name).tap do |genre|
#       genre.save
#     end
#   end

#   def songs
#     @songs
#   end


#   def add_song(song)
#     song.genre = self unless song.genre == self
#     @songs << song unless @songs.include?(song)
#   end


#   def artists
#     artists = @songs.collect do |song|
#       song.artist
#     end
#     artists.uniq
#   end

# end


module Concerns::Findable
  def find_by_name(name)
    self.all.detect {|song| song.name == name}
  end

  def find_or_create_by_name(name)
    # if self.find_by_name(name)
    #   self.find_by_name(name)
    # else
    # song = self.create(name)
    # end

    self.find_by_name(name) || self.create(name)


  end
end


