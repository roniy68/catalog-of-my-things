class Genre
  attr_accessor :id, :name, :items

  def initialize(id, name)
    @id = id || rand(1..1000)
    @name = name
    @items = []
  end

  def add_items(item)
    @items << item
    item.genre = self
  end
end
