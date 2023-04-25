class Label
  attr_reader :title, :color

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

  def create_json
    labelhash = { title: @title, color: @color }
    JSON.generate(labelhash)
  end

  def print_data
    "Label Title: #{@title} - Color: #{@color}\n"
  end
end
