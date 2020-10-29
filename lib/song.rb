require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical 
    @@all.sort_by do |song|
      song.name
    end
  end


  def self.new_from_filename(filename)
    file = filename.split(/-|.mp3/)
    good_file = file.collect do |word|
      word.strip
    end
    song = self.new

    song.artist_name = good_file[0]
    song.name = good_file[1]
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(/-|.mp3/)
    good_file = file.collect do |word|
      word.strip
    end
    song = self.create

    song.artist_name = good_file[0]
    song.name = good_file[1]
    song
  end

  def


end
