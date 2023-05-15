# encoding: utf-8

require_relative 'product'

class Disk < Product
  attr_accessor :title, :artist, :year, :genre

  def self.from_file(file_path)
    lines = File.readlines(file_path, encoding: 'UTF-8', chomp: true)

    new(
      title: lines[0],
      artist: lines[1],
      genre: lines[2],
      year: lines[3],
      price: lines[4],
      amount: lines[5]
    )
  end

  def initialize(params)
    super

    @title = params[:title]
    @year = params[:year]
    @artist = params[:artist]
    @genre = params[:genre]
  end

  def info
    "Альбом #{@artist} — «#{@title}», #{@genre}, #{@year}"
  end

  def update(params)
    super

    @title = params[:title] if params[:title]
    @year = params[:year] if params[:year]
    @genre = params[:genre] if params[:genre]
    @artist = params[:artist] if params[:artist]
  end
end
