require_relative 'spec_helper'

describe Game do
  game = Game.new('2020-01-01', multiplayer: true)

  it 'takes two parameters and returns a Game object' do
    expect(game).to be_an_instance_of Game
  end

  it 'returns the last played at' do
    expect(game.last_played_at).to eq '2020-01-01'
  end

  it 'returns the multiplayer' do
    expect(game.multiplayer).to eq true
  end

  it 'shuld have a method to check if it can be archived' do
    expect(game).to respond_to(:can_be_archived)
  end
end
