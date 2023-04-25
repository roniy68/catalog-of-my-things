require_relative './item'
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
      cover_state: @cover_state,
      labeltitle: @label.title,
      labelcolor: @label.color
    }
    JSON.generate(bookhash)
  end

  def print_data
    "Publisher: #{@publisher} - Date: #{@publish_date} State: #{@cover_state}\n"
  end

  private

  def can_be_archived?
    super == true ? true : @cover_state == 'bad'
  end
end
