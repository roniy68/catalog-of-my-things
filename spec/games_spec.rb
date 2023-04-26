require_relative '../modules/games'

describe Games do
  before :each do
    @games = Games.new
  end

  it '#add_game' do
    game = @games.add_game('GTA', 'Yes', '2022-02-13', '2023-04-05')
    expect(game).to be_instance_of(Game)
    expect(@games.gameslist.length).to eql 1
  end
end
