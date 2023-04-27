require 'json'
require_relative './item'
class Book < Item
  def initialize(name, date, publisher, cover_state)
    super(name, date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def create_json
    {
      type: 'Book',
      name: @name,
      date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state,
      labeltitle: @label.title,
      labelcolor: @label.color,
      genre: @genre.name,
      auth_fname: @author.first_name,
      auth_lname: @author.last_name,
    }
  end

  def print_data
    "Book Title - #{@name} | Author: #{@author.first_name} #{@author.last_name} | Publisher - #{@publisher} " \
      "| Publish date - #{@publish_date} | State - #{@cover_state}\n"
  end

  private

  def can_be_archived?
    super || @cover_state == 'bad'
  end
end
