require './item.rb'

class Author < Item
  attr_accessor :first_name, :last_name

  initialize(id, first_name, last_name)
    @id = id
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  item = Item.new()

  def add_item=(item)
    items.push(item)
  end
end