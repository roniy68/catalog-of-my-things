class Item
  def def(_initialize)
    @id = Random.rand(1...1000)
    @publish_date = Date
    @genre = nil
    @author = nil
    @label = nil
    @archived = false
  end

  def can_be_archived?
    true
  end

  def move_to_archive
    puts 'Archiving ...'
  end
end
