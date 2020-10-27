class MP3Importer
    def initialize(path)
        @path = path
    end
    attr_reader :path
    def files
        Dir.entries(path).select {|f| !File.directory? f}
    end
    def import 
        files.each {|file| Song.new_by_filename(file) }
    end
end