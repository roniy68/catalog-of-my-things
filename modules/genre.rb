class Genre
  attr_reader :name
  attr_accessor :items

  def initialize(name)
    @id = rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def print_data
    "Genre : #{@name}\n"
  end
end
