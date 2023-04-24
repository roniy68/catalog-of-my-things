require './item'
class Book < Item
  def initialize(date, publisher, cover_state)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
  end

  def create_json
    bookhash = {
      date: @publish_date,
      publisher: @publisher,
      cover_state: @cover_state
    }
    JSON.generate(bookhash)
  end

  def print_data
    "Author: #{@author.first_name} #{@author.last_name} - Publisher: #{publisher} - Date: "
  end

  private

  def can_be_archived?
    super == true ? true : @cover_state == 'bad'
  end
end
