require 'date'

class Item
  attr_reader :label, :author, :genre

  def initialize(name, date)
    @id = Random.rand(1...1000)
    @name = name
    @publish_date = Date.parse(date)
    @genre = nil
    @author = nil
    @label = nil
    @archived = false
  end

  def genre=(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.year >= 10
  end
end
