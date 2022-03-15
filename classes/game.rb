require 'date'
require './item.rb'

class Game < Item
  attr_accessor :multiplayer, :last_played_at

  initialize(multiplayer, last_played_at)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @can_be_archived = can_be_archived
  end

  item = Item.new

  def can_be_archived?
    if item.can_be_archived && last_played_at > 2
      true
    else
      false
    end
  end
end