class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    # has many songs
    def songs
        Song.all.select{|song| song.artist == self}
    end

    # takes arg of song, associates song with artist, tell song belong to artist
    def add_song(song)
        song.artist = self
    end

    # takes arg of song name, creates new song and associates with artist
    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    # class method => total # songs associated to all existing artists.
    def self.song_count
        Song.all.count
    end

end