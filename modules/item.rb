require 'date'

class Item
  attr_accessor :label, :author

  def initialize(name, date)
    @id = Random.rand(1...1000)
    @name = name
    @publish_date = Date.parse(date)
    @genre = nil
    @author = nil
    @label = nil
    @archived = false
  end

  def move_to_archive
    @archived = can_be_archived?
  end

  private

  def can_be_archived?
    Time.now.year - @publish_date.year >= 10
  end
end
