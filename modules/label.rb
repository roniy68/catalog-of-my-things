class Label
  attr_reader :title, :color, :items

  def initialize(title, color)
    @id = Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end

  def print_data
    "Label Title - #{@title} | Color - #{@color}\n"
  end
end
