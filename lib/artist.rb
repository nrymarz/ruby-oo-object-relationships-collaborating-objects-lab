class Artist
    @@all = []
    def initialize(name)
        @name = name
        @@all << self
    end
    attr_accessor :name
    def add_song(song)
        song.artist = self
    end
    def add_song_by_name(song)
        song = Song.new(song)
        song.artist = self
    end
    def songs
        Song.all.select {|song| song.artist == self}
    end
    def self.all
        @@all
    end
    def print_songs
        self.songs.each {|song| puts song.name}
    end
    def self.find_or_create_by_name(name)
        if artist = self.all.find{|artist| artist.name == name}
            artist
        else
            Artist.new(name)
        end
    end
end