require_relative './label'

class Labels
  attr_accessor :labelslist
  def initialize
    @labelslist = []
  end

  def create_label(item)
    print "Add label title: \n"
    labelname = gets.chomp
    print "Add label color: \n"
    labelcolor = gets.chomp
    add_label(item, labelname, labelcolor)
  end

  def add_label(item, name, color)
    existing_label =
      @labelslist.find do |label|
        label.title.downcase == name.downcase &&
          label.color.downcase == color.downcase
      end
    if existing_label
      existing_label.add_item(item)
    else
      new_label = Label.new(name, color)
      new_label.add_item(item)
      @labelslist << new_label
    end
  end
end
