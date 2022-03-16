require './classes/game'
require 'date'

describe Game do
  context 'It should create a game' do
    new_game = Game.new(multiplayer: false, publish_date: Date.parse('2020/10/26'),
                        last_played_at: Date.parse('2022/10/26'))
    it 'should create a new game' do
      expect(new_game.multiplayer).to eq false
    end
    it 'should create an instance of Game' do
      expect(new_game).to be_an_instance_of Game
    end
    it 'should have a publish date' do
      expect(new_game.publish_date).to eq Date.parse('2020/10/26')
    end
    it 'should have a last played at date' do
      expect(new_game.last_played_at).to eq Date.parse('2022/10/26')
    end
  end
end
