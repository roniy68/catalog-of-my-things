require_relative './game'
require_relative './author'
require_relative './label'
require_relative './validator'
class Games
  include Validator
  attr_accessor :gameslist

  def initialize
    @gameslist = []
  end

  def create_game
    print "Enter Game name: \n"
    name = validate_empty('Game Name')
    print "Is game multiplayer?[yes/no]: \n"
    player = validate_empty('Multiplayer')
    print "Enter publish date [YYYY-MM-DD]: \n"
    date = validate_date
    print "Enter last_played_at [YYYY-MM-DD]: \n"
    last_played_at = validate_date
    add_game(capitalize_text(name), player, date, last_played_at)
  end

  def add_game(name, player, date, last_played_at)
    game = Game.new(name, date, player, last_played_at)
    @gameslist << game
    game
  end
end
