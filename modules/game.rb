require_relative 'item'
require 'json'

class Game < Item
  def initialize(name, date, multiplayer, last_played_at)
    super(name, date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def create_json
    gamehash = {
      type: 'Game',
      name: @name,
      date: @publish_date,
      last_played_at: @last_played_at,
      multiplayer: @multiplayer,
      labeltitle: @label.title,
      labelcolor: @label.color,
      genre: @genre.name,
      auth_fname: @author.first_name,
      auth_lname: @author.last_name
    }
    JSON.generate(gamehash)
  end

  def print_data
    "Game Title - #{@name} | Multiplayer - #{@multiplayer} | Date - #{@publish_date} " \
      "| last_played_at - #{@last_played_at}\n"
  end

  private

  def can_be_archived?
    super && (Time.now.year - @last_played_at.year) >= 2
  end
end
