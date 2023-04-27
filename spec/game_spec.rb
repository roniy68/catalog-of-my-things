require_relative '../modules/game'

describe Game do
  before :each do
    @game = Game.new('Fifa23', '2022-09-08', 'Yes', '2023-09-08')
    author = double('author')
    allow(author).to receive(:first_name) { 'Harry' }
    allow(author).to receive(:last_name) { 'Ram' }
    allow(author).to receive(:items) { [] }
    label = double('label')
    allow(label).to receive(:title) { 'dummy title' }
    allow(label).to receive(:color) { 'dummy color' }
    allow(label).to receive(:items) { [] }
    genre = double('genre')
    allow(genre).to receive(:name) { 'dummy genre' }
    allow(genre).to receive(:items) { [] }
    @game.genre = genre
    @game.author = author
    @game.label = label
  end
  it 'create game instance' do
    expect(@game).to be_instance_of(Game)
    expect(@game).to be_kind_of(Item)
  end
  it '#create_json' do
    expect(@game.create_json).not_to be_nil
    expect(@game.create_json).to be_instance_of(String)
  end

  it '#print_data' do
    expect(
      @game.print_data
    ).to eql "Game Title - Fifa23 | Multiplayer - Yes | Date - 2022-09-08 | last_played_at - 2023-09-08\n"
  end
end
