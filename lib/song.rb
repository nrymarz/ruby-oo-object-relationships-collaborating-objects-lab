class Song
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    attr_accessor :name, :artist
    def self.all
        @@all
    end
    def artist_name=(name)
       self.artist = Artist.find_or_create_by_name(name)
    end
    def self.new_by_filename(file)
        file = file.split(" - ")
        song = self.new(file[1])
        song.artist_name= file[0]
        song
    end
end
