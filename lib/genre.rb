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







